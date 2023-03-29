import 'package:astro_chat_ai/modules/chart_image/controllers/chart_image_controller.dart';
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
        child: SingleChildScrollView(
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
                      return Container(
                        width: 280,
                        height: 280,
                        color: Colors.deepPurpleAccent.withOpacity(0.2),
                        child: UIImage(
                          image: ctrl.chartImage!,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
