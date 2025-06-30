import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:get/get.dart' as gets;
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphview/GraphView.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:wallethunter/theme/app_colors.dart';

import '../../controllers/bottom_bar_controller.dart';
import 'components/bottom_sheetexport.dart';

class FamilyMember {
  final String name;
  final List<FamilyMember> children;

  FamilyMember({required this.name, this.children = const []});
}

class FamilyTree extends StatelessWidget {
  final GlobalKey _repaintKey = GlobalKey();
  final _controller = gets.Get.put<BottomBarController>(BottomBarController());
  final Graph graph = Graph();
  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  FamilyTree({super.key}) {
    _buildGraphFromData();
    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (50)
      ..subtreeSeparation = (100)
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  // FamilyMember head = FamilyMember(
  //   name: "Rahul Patel",
  //   children: [
  //     FamilyMember(name: "Son - Aryan"),
  //     FamilyMember(name: "Daughter - Riya"),
  //     FamilyMember(
  //       name: "Brother - Amit",
  //       children: [FamilyMember(name: "Nephew - Kunal")],
  //     ),
  //   ],
  // );
  Future<Uint8List?> captureImage() async {
    try {
      RenderRepaintBoundary boundary =
          _repaintKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;

      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print("Error capturing image: $e");
      return null;
    }
  }

  Map<String, GlobalKey> keys = {};

  Future<void> saveAsImage(Uint8List imageBytes) async {
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/family_tree.png';
    final file = File(path);
    await file.writeAsBytes(imageBytes);
    final result = await OpenFile.open(path);
    print(result.message); // Optional debug
  }

  Future<void> exportToPDF(Uint8List imageBytes) async {
    final pdf = pw.Document();

    final image = pw.MemoryImage(imageBytes);
    pdf.addPage(pw.Page(build: (context) => pw.Center(child: pw.Image(image))));

    final directory = await getTemporaryDirectory();
    final filePath = "${directory.path}/family_tree.pdf";
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    // 📂 Open the file
    final result = await OpenFile.open(filePath);
    print(result.message); // Optional debug
  }

  void _buildGraphFromData() {
    Map<String, Node> nodes = {};

    Node addNode(String name) {
      if (!nodes.containsKey(name)) {
        nodes[name] = Node.Id(name);
      }
      return nodes[name]!;
    }

    final headName = _controller.familyMember["name"];
    final headNode = addNode(headName);
    graph.addNode(headNode);

    for (var member in _controller.familyMember["members"]) {
      final memberName = member["name"];
      final relation = member["relation"];
      final memberNode = addNode(memberName);

      switch (relation.toLowerCase()) {
        case "wife":
        case "husband":
          graph.addEdge(headNode, memberNode);
          break;
        case "son":
        case "daughter":
          graph.addEdge(headNode, memberNode);
          break;
        case "father":
        case "mother":
          graph.addEdge(memberNode, headNode);
          break;
        case "grand father":
        case "grand mother":
          final parent = _controller.familyMember["members"].firstWhere(
            (e) => e["relation"] == "Father" || e["relation"] == "Mother",
            orElse: () => null,
          );
          if (parent != null) {
            final parentNode = addNode(parent["name"]);
            graph.addEdge(memberNode, parentNode);
          }
          break;
        default:
          graph.addEdge(headNode, memberNode); // fallback
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Tree"),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () async {
              showExportOptions(
                onPdfTap: () async {
                  final imageBytes = await captureImage();
                  if (imageBytes != null) {
                    await exportToPDF(imageBytes);
                  }
                },
                onImageTap: () async {
                  final imageBytes = await captureImage();
                  if (imageBytes != null) {
                    await saveAsImage(imageBytes);
                  }
                },
              );
            },

            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.lightPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Export",
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.whiteBackgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(80),

              child: RepaintBoundary(
                key: _repaintKey,
                child: CustomPaint(
                  painter: LinePainter(
                    familyData: _controller.familyMember,
                    members: _controller.familyMember["members"],
                    keys: {},
                  ),
                  child: buildFamilyTree(_controller.familyMember),
                ),
              ),
            ),
          ),
        ],
        //   Expanded(
        //     child: InteractiveViewer(
        //       constrained: false,
        //       boundaryMargin: EdgeInsets.all(80),

        //       child: RepaintBoundary(
        //         key: _repaintKey,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: GraphView(
        //             graph: graph,
        //             algorithm: BuchheimWalkerAlgorithm(
        //               builder,
        //               TreeEdgeRenderer(builder),
        //             ),
        //             builder: (Node node) {
        //               return familyNodeWidget(node.key!.value as String);
        //             },
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
    );
  }

  Widget familyNodeWidget(String name) {
    return Card(
      color: Colors.teal[50],
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _buildTree(Node parentNode, var member) {
    for (int i = 0; i < member.length; i++) {
      final childNode = Node.Id(member[i]["name"]);
      graph.addEdge(parentNode, childNode);
      //  _buildTree(childNode, member[i]);
    }
  }

  Widget _buildNode(String name) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.whiteBackgroundColor,
                width: 1,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/icons/profile.jpeg"),
                // image: controller.profileList[0].data?.profileImage.toString() !="null" && controller.profileList[0].data?.profileImage.toString()!=""? NetworkImage(data.profileImage.toString(), scale: 1.1):AssetImage('assets/images/aa.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildFamilyTree(Map<String, dynamic> data) {
    final members = data['members'] as List;

    // Categorize members
    final wife = members
        .where((m) => m['relation'].toLowerCase() == 'wife')
        .toList();
    final children = members
        .where((m) => ['son', 'daughter'].contains(m['relation'].toLowerCase()))
        .toList();
    final parents = members
        .where(
          (m) => ['father', 'mother'].contains(m['relation'].toLowerCase()),
        )
        .toList();
    final grandparents = members
        .where(
          (m) => [
            'grand father',
            'grand mother',
          ].contains(m['relation'].toLowerCase()),
        )
        .toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          // Grandparents
          if (grandparents.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: grandparents
                  .map((g) => personBox(g['name'], g['relation'], key: GlobalKey()),)
                  .toList(),
            ),
          const SizedBox(height: 20),

          // Parents
          if (parents.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: parents
                  .map((p) => personBox(p['name'], p['relation'], key: GlobalKey()),)
                  .toList(),
            ),
          const SizedBox(height: 20),

          // Head + Spouse
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              personBox(data['name'], "Head", key: GlobalKey()),
              const SizedBox(width: 20),
              if (wife.isNotEmpty)
                personBox(wife.first['name'], wife.first['relation'], key: GlobalKey()),
            ],
          ),

          const SizedBox(height: 20),

          // Children
          if (children.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children
                  .map((c) => personBox(c['name'], c['relation'], key: GlobalKey()),)
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget personBox(String name, String relation, {required GlobalKey key}) {
    keys[name] = key; // store in map
  return Container(
    key: key,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: const Color.fromARGB(255, 194, 226, 251)),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: GoogleFonts.quicksand(
              color: AppTheme.linkColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            relation,
            style: GoogleFonts.quicksand(
              color: AppTheme.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final List members;
  final Map<String, GlobalKey> keys;
  final Map<String, dynamic> familyData;

  LinePainter({
    required this.members,
    required this.keys,
    required this.familyData,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final headBox = _getBox(familyData['name']);

    for (var member in members) {
      final name = member["name"];
      final relation = member["relation"];

      final memberBox = _getBox(name);
      if (memberBox == null || headBox == null) continue;

      final memberOffset = memberBox.localToGlobal(
        memberBox.size.center(Offset.zero),
      );
      final headOffset = headBox.localToGlobal(
        headBox.size.center(Offset.zero),
      );

      if (relation.toLowerCase() == "wife" ||
          relation.toLowerCase() == "husband") {
        // Side-by-side connection
        canvas.drawLine(headOffset, memberOffset, paint);
      } else if (relation.toLowerCase() == "son" ||
          relation.toLowerCase() == "daughter") {
        // Top to bottom connection
        canvas.drawLine(
          headOffset.translate(0, headBox.size.height / 2),
          memberOffset.translate(0, -memberBox.size.height / 2),
          paint,
        );
      } else if (relation.toLowerCase() == "father" ||
          relation.toLowerCase() == "mother") {
        // Parent to head
        canvas.drawLine(
          memberOffset.translate(0, memberBox.size.height / 2),
          headOffset.translate(0, -headBox.size.height / 2),
          paint,
        );
      }
    }
  }

  RenderBox? _getBox(String name) {
    final key = keys[name];
    return key?.currentContext?.findRenderObject() as RenderBox?;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
