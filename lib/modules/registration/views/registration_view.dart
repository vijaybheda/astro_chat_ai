import 'package:astro_chat_ai/enumerations.dart';
import 'package:astro_chat_ai/models/user_data.dart';
import 'package:astro_chat_ai/modules/registration/controllers/registration_controller.dart';
import 'package:astro_chat_ai/services/route_service/routes.dart';
import 'package:astro_chat_ai/theme/colors.dart';
import 'package:astro_chat_ai/theme/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give birth detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              TextFormField(
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  hintText: "Enter your name",
                  labelText: 'Name',
                  hintStyle: AppFontStyle.bodyMedium?.copyWith(
                    color: ThemeColors.black10.withOpacity(0.18),
                  ),
                  counterText: "",
                  filled: false,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.black10.withOpacity(0.18),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.black10.withOpacity(0.18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              /// DOB
              GetBuilder<RegistrationController>(
                  id: 'DOBController',
                  builder: (ctrl) {
                    return TextFormField(
                      controller: controller.dobController,
                      readOnly: true,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime(1950, 1, 1),
                          maxTime: DateTime.now(),
                          currentTime: DateTime.now(),
                          theme: DatePickerTheme(
                            itemStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ThemeColors.black20),
                            doneStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ThemeColors.primaryColor),
                            cancelStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ThemeColors.grey),
                          ),
                          onChanged: (date) {},
                          onConfirm: (date) {
                            controller.dob = date;

                            String jobDateString =
                                DateFormat('dd/MM/yyyy').format(date);

                            controller.dobController.text = jobDateString;

                            controller.update(['DOBController']);
                          },
                        );
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        hintText: "DOB (DD/MM/YYYY)",
                        hintStyle: AppFontStyle.bodyMedium?.copyWith(
                          color: ThemeColors.black10.withOpacity(0.18),
                        ),
                        labelText: 'DOB',
                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 16.0),

              /// Place of Birth
              TextFormField(
                controller: controller.placeOfBirthController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  hintText: "Enter Place of Birth",
                  labelText: 'Place of Birth',
                  hintStyle: AppFontStyle.bodyMedium?.copyWith(
                    color: ThemeColors.black10.withOpacity(0.18),
                  ),
                  filled: false,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.black10.withOpacity(0.18),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.black10.withOpacity(0.18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              /// Latitude
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.latController,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        hintText: "Enter Latitude",
                        labelText: 'Latitude',
                        hintStyle: AppFontStyle.bodyMedium?.copyWith(
                          color: ThemeColors.black10.withOpacity(0.18),
                        ),
                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Longitude
                  Expanded(
                    child: TextFormField(
                      controller: controller.longController,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        hintText: "Enter Longitude",
                        labelText: 'Longitude',
                        hintStyle: AppFontStyle.bodyMedium?.copyWith(
                          color: ThemeColors.black10.withOpacity(0.18),
                        ),
                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              /// Time of Birth
              GetBuilder<RegistrationController>(
                  id: 'TimeOfBirthController',
                  builder: (ctrl) {
                    return TextFormField(
                      controller: controller.timeOfBirthController,
                      readOnly: true,
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        DatePicker.showTimePicker(context,
                            showTitleActions: true, onConfirm: (DateTime time) {
                          ctrl.time = TimeOfDay.fromDateTime(time);
                          controller.timeOfBirthController.text =
                              ctrl.time!.format(context);
                          ctrl.update(['TimeOfBirthController']);
                        }, currentTime: DateTime.now());
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        hintText: "Time of Birth",
                        labelText: 'Time of Birth',
                        hintStyle: AppFontStyle.bodyMedium?.copyWith(
                          color: ThemeColors.black10.withOpacity(0.18),
                        ),
                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeColors.black10.withOpacity(0.18),
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 16.0),

              GetBuilder<RegistrationController>(
                  id: "SelectedUserGender",
                  builder: (ctrl) {
                    return Row(
                      children: [
                        const Text('Gender: '),
                        CupertinoSlidingSegmentedControl<UserGender>(
                          children: {
                            UserGender.male: Text(
                              'Male',
                              style: buildSegment(context, UserGender.male),
                            ),
                            UserGender.female: Text(
                              'Female',
                              style: buildSegment(context, UserGender.female),
                            ),
                            UserGender.other: Text(
                              'Other',
                              style: buildSegment(context, UserGender.other),
                            ),
                          },
                          onValueChanged: (value) {
                            controller.selectedGender = value!;
                            controller.update(["SelectedUserGender"]);
                          },
                          groupValue: controller.selectedGender,
                        ),
                      ],
                    );
                  }),
              const SizedBox(height: 16.0),

              TextFormField(
                controller: controller.phoneNoController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  hintText: "Enter Phone No",
                  labelText: 'Phone No',
                  hintStyle: AppFontStyle.bodyMedium?.copyWith(
                    color: ThemeColors.black10.withOpacity(0.18),
                  ),
                  counterText: "",
                  filled: false,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.black10.withOpacity(0.18),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.black10.withOpacity(0.18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      UserData? validUserData = getUserData();
                      if (validUserData != null) {
                        Get.toNamed(RoutesName.chartImage,
                            arguments: {'UserData': validUserData});
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text('Submit')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle? buildSegment(BuildContext context, UserGender userGender) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
        fontSize: 15,
        color: controller.selectedGender == userGender
            ? ThemeColors.primaryColor
            : Colors.grey,
        fontWeight: FontWeight.w700);
  }

  UserData? getUserData() {
    UserData? userData = UserData();

    if (controller.dobController.text.isEmpty) {
      showSnackBar(
          title: 'Date Of Birth', subTitle: 'Please select Date of birth.');
      return null;
    }
    if (controller.placeOfBirthController.text.isEmpty) {
      showSnackBar(
          title: 'Place Of Birth', subTitle: 'Please select Place of birth.');
      return null;
    }
    if (controller.latController.text.isEmpty) {
      showSnackBar(
          title: 'Latitude', subTitle: 'Please enter birthplace Latitude.');
      return null;
    }
    // if (!controller.latLongRegex.hasMatch(controller.latController.text)) {
    //   showSnackBar(
    //       title: 'Latitude', subTitle: 'Please enter valid Latitude.');
    //   return null;
    // }
    if (controller.longController.text.isEmpty) {
      showSnackBar(
          title: 'Longitude', subTitle: 'Please enter birthplace Longitude.');
      return null;
    }

    // if (!controller.latLongRegex.hasMatch(controller.longController.text)) {
    //   showSnackBar(
    //       title: 'Longitude', subTitle: 'Please enter valid Longitude.');
    //   return null;
    // }
    if (controller.timeOfBirthController.text.isEmpty) {
      showSnackBar(
          title: 'Time Of Birth', subTitle: 'Please select Time of birth.');
      return null;
    }
    userData = userData.copyWith(
      timeOfBirth: controller.time,
      dob: controller.dob,
      placeOfBirth: controller.placeOfBirthController.text,
      birthplaceLat: controller.latController.text,
      birthplaceLong: controller.longController.text,
    );
    return userData;
  }

  void showSnackBar({required String title, required String subTitle}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      subTitle,
      colorText: Colors.white,
      backgroundColor: ThemeColors.primaryColor.withOpacity(.55),
    );
  }
}
