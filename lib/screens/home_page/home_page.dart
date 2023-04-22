import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/controllers/main_page_controller.dart';
import 'package:reminder/data/styles/app_colors.dart';
import 'package:reminder/widgets/list_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: controller.empty
                  ? SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.today.isNotEmpty
                                  ? const Text(
                                      "Today",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8B87B3),
                                      ),
                                    )
                                  : const SizedBox(),
                              controller.today.isNotEmpty
                                  ? SizedBox(
                                      height: 90 *
                                          controller.today.length.toDouble(),
                                      child: ListView.builder(
                                          itemCount: controller.today.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return SwipeView(
                                              colorIndex: controller
                                                  .today[index].colorIndex,
                                              delete: (BuildContext contex) {
                                                Get.log('ishlade');
                                                controller.remove(controller
                                                    .today[index].starTime!);
                                                Get.log('ishlade');
                                              },
                                              dateTime: controller
                                                  .today[index].starTime!,
                                              time:
                                                  "${controller.today[index].starTime?.hour}:${controller.today[index].starTime?.minute}",
                                              content: controller
                                                  .today[index].content,
                                            );
                                          }),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 10,
                              ),
                              controller.tomorrow.isNotEmpty
                                  ? const Text(
                                      "Tommorrow",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8B87B3),
                                      ),
                                    )
                                  : const SizedBox(),
                              controller.tomorrow.isNotEmpty
                                  ? SizedBox(
                                      height: 90 *
                                          controller.tomorrow.length.toDouble(),
                                      child: ListView.builder(
                                          itemCount: controller.tomorrow.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return SwipeView(
                                              colorIndex: controller
                                                  .tomorrow[index].colorIndex,
                                              dateTime: controller
                                                  .tomorrow[index].starTime!,
                                              time:
                                                  "${controller.tomorrow[index].starTime?.hour}:${controller.tomorrow[index].starTime?.minute}",
                                              content: controller
                                                  .tomorrow[index].content,
                                            );
                                          }),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 10,
                              ),
                              controller.morethan2.isNotEmpty
                                  ? const Text(
                                      "After More than 2 days",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8B87B3),
                                      ),
                                    )
                                  : const SizedBox(),
                              controller.morethan2.isNotEmpty
                                  ? SizedBox(
                                      height: 90 *
                                          controller.morethan2.length
                                              .toDouble(),
                                      child: ListView.builder(
                                          itemCount:
                                              controller.morethan2.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return SwipeView(
                                              colorIndex: controller
                                                      .morethan2[index]
                                                      .colorIndex ??
                                                  2,
                                              dateTime: controller
                                                  .morethan2[index].starTime!,
                                              time:
                                                  "${controller.morethan2[index].starTime?.hour}:${controller.morethan2[index].starTime?.minute}",
                                              content: controller
                                                  .morethan2[index].content,
                                            );
                                          }),
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                    )
                  : SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(
                              image:
                                  AssetImage('assets/icons/Group 12 (1).png')),
                          SizedBox(
                            height: 70,
                          ),
                          Text("No tasks",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: Color(0xff554E8F),
                              )),
                          SizedBox(
                            height: 150,
                          )
                        ],
                      )));
        });
  }
}
