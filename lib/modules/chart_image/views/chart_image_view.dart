import 'package:astro_chat_ai/headers.dart';
import 'package:astro_chat_ai/modules/chart_image/controllers/chart_image_controller.dart';
import 'package:astro_chat_ai/search_text_field_widget.dart';
import 'package:astro_chat_ai/text_card.dart';
import 'package:astro_chat_ai/theme/colors.dart';
import 'package:astro_chat_ai/ui_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartImageScreen extends GetView<ChartImageController> {
  const ChartImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// DOB
            const SizedBox(height: 16.0),
            Center(
              child: GetBuilder<ChartImageController>(
                  id: 'ChartImage',
                  builder: (ctrl) {
                    if (ctrl.isLoading ?? true) {
                      return const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ThemeColors.primaryColor,
                            ),
                          ),
                        ),
                      );
                    }
                    if (ctrl.chartImage == null) {
                      return const Center(
                          child: Text(
                        'Something went wrong!!',
                        textAlign: TextAlign.center,
                      ));
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: ctrl.isKeyboardVisible.value
                              ? SizedBox()
                              : Container(
                                  width: 280,
                                  height: 280,
                                  color:
                                      ThemeColors.primaryColor.withOpacity(0.2),
                                  child: UIImage(
                                    image: ctrl.chartImage!,
                                  ),
                                ),
                        ),
                        IconButton(
                            onPressed: () {
                              ctrl.toggle();
                            },
                            icon: Icon(ctrl.isKeyboardVisible.value
                                ? Icons.open_in_full_outlined
                                : Icons.close_fullscreen_outlined))
                      ],
                    );
                  }),
            ),
            Obx(() => Expanded(
                  child: Column(children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: controller.messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final textData = controller.messages[index];
                          return textData.index == -999999
                              ? MyTextCard(textData: textData)
                              : TextCard(textData: textData);
                        },
                      ),
                    ),
                    controller.state.value == ApiState.loading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                    const SizedBox(height: 8),
                    SearchTextFieldWidget(
                        color: ThemeColors.primaryColor.withOpacity(0.8),
                        textEditingController: controller.searchTextController,
                        onTap: () {
                          if (controller.searchTextController.text.isEmpty) {
                            return;
                          }
                          controller.getTextCompletion(
                              controller.searchTextController.text.trim(),
                              Get.arguments['UserData']);
                        }),
                    const SizedBox(height: 20),
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
