import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallethunter/controllers/register_controller.dart';

import '../../../components/bottom_sheet.dart';
import '../../../components/multiline_textbox.dart';
import '../../../components/user_input_field.dart';
import '../../../theme/app_colors.dart';
import 'package:intl/intl.dart';

buildPersonalForm(
  context,
  RegisterController _controller,
  GlobalKey key,
  type,
) {
  return Expanded(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Information",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.blackColor,
                ),
              ),
              SizedBox(height: 20),
              if (type == 2)
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _controller.getImage(ImageSource.gallery);
                    },
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          if (_controller.profileImage != null &&
                              _controller.profileImage != "")
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                _controller.profileImage!,
                                height: 100,
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                            )
                          else
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.whiteBackgroundColor,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/icons/profile.jpeg",
                                  ),
                                  // image: controller.profileList[0].data?.profileImage.toString() !="null" && controller.profileList[0].data?.profileImage.toString()!=""? NetworkImage(data.profileImage.toString(), scale: 1.1):AssetImage('assets/images/aa.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 0),
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (type == 2) SizedBox(height: 20),
              // SizedBox(height: 6),
              // Text(
              //   "Let us get to know you a bit better by sharing your personal info",
              //   style: GoogleFonts.inter(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //     color: AppTheme.blackColor,
              //   ),
              // ),
              if (type == 2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Relation with Family Head ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.blackColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    MyTextField(
                      textEditingController: _controller.releationController,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Relation with Family Head is required";
                        }
                        return null;
                      },
                      readOnly: true,
                      ontap: () {
                        ModalSheet.showModal(
                          context,
                          _controller.relationOptions,

                          (value) {
                            _controller.releationController.text = value;
                          },

                          _controller.releationController.text,
                        );
                      },
                      hintText: "Please Select ",
                      icon: Icon(Icons.arrow_drop_down),
                      color: const Color(0xff585A60),
                    ),
                  ],
                ),
              if (type == 2) SizedBox(height: 10),
              if (type == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.blackColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    MyTextField(
                      textEditingController: _controller.nameController,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },

                      hintText: "EX: John ",

                      color: const Color(0xff585A60),
                    ),
                  ],
                ),
              if (type == 2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.blackColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    MyTextField(
                      textEditingController: _controller.nameController,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },

                      hintText: "EX: John ",

                      color: const Color(0xff585A60),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Middle Name",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.blackColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    MyTextField(
                      textEditingController: _controller.middleNameController,

                      hintText: "EX: David ",

                      color: const Color(0xff585A60),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Last Name",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.blackColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    MyTextField(
                      textEditingController: _controller.lastNameController,

                      hintText: "EX: Smith ",

                      color: const Color(0xff585A60),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController: _controller.genderController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Gender is required";
                            }
                            return null;
                          },
                          readOnly: true,
                          ontap: () {
                            ModalSheet.showModal(
                              context,
                              _controller.genderList,

                              (value) {
                                _controller.genderController.text = value;
                              },

                              _controller.genderController.text,
                            );
                          },
                          hintText: "Select your Gender ",
                          icon: Icon(Icons.arrow_drop_down),
                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Age",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController: _controller.ageController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Age is required";
                            }
                            return null;
                          },
                          textInputType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],

                          hintText: "Ex 50 ",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                "Marital Status",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.maritalStatusController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Marital Status is required";
                  }
                  return null;
                },
                readOnly: true,
                ontap: () {
                  ModalSheet.showModal(
                    context,
                    _controller.martialStatus,

                    (value) {
                      _controller.maritalStatusController.text = value;
                    },

                    _controller.maritalStatusController.text,
                  );
                },

                hintText: "Select your Marital Status ",
                icon: Icon(Icons.arrow_drop_down),
                color: const Color(0xff585A60),
              ),
              if (type == 1) SizedBox(height: 20),
              if (type == 1)
                Text(
                  "Samaj Name",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blackColor,
                  ),
                ),
              if (type == 1) const SizedBox(height: 6),
              if (type == 1)
                MyTextField(
                  textEditingController: _controller.samajController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Samaj Name is required";
                    }
                    return null;
                  },
                  readOnly: true,
                  ontap: () {
                    ModalSheet.showModal(
                      context,
                      _controller.samajList,

                      (value) {
                        _controller.samajController.text = value;
                      },

                      _controller.samajController.text,
                    );
                  },
                  hintText: "Select your Samaj Name ",
                  icon: Icon(Icons.arrow_drop_down),
                  color: const Color(0xff585A60),
                ),
              SizedBox(height: 20),
              Text(
                "Occupation",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.occupationController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Occupation is required";
                  }
                  return null;
                },

                hintText: "EX: Teacher ",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
              Text(
                "Qualification",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.qualificationController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Qualification is required";
                  }
                  return null;
                },

                hintText: "EX: Btech ",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Birth Date",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController:
                              _controller.birthDateController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          readOnly: true,
                          ontap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2025),
                            );

                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate = DateFormat(
                                'dd/MM/yyyy',
                              ).format(pickedDate);
                              print(formattedDate);
                              _controller.birthDateController.text =
                                  formattedDate; //set output date to TextField value.
                            } else {
                              print("end from date is not selected");
                            }
                          },
                          hintText: "Select your DOB ",
                          icon: Icon(Icons.calendar_month, size: 20),
                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood Group",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController:
                              _controller.bloodGroupController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Blood Group is required";
                            }
                            return null;
                          },

                          hintText: "Ex: B+ ",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Exact Nature of Dutiess",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: InputTextFieldMaxlines(
                  textEditingController: _controller.dutiesController,
                  hintText: "Enter here..",
                  counterText: "1000",
                  onTap: () {
                    //  Get.to(CertificateDescription(), fullscreenDialog: true);
                  },
                  maxLines: 3,

                  maxlength: 1000,
                  // textLength: _controller.description.length,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
