import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:reminder/controllers/main_page_controller.dart';
import 'package:reminder/data/styles/app_assets.dart';
import 'package:reminder/data/styles/app_colors.dart';
import 'package:reminder/screens/home_page/home_page.dart';
import 'package:reminder/screens/task_page/task_page.dart';

import '../widgets/time_view.dart';

class MainPage extends StatelessWidget {
  static const String id = '/main_page';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: controller.isNeedBanner &&controller.reminderWord.isNotEmpty? 251 : 115,
                      width: Get.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(controller.isNeedBanner&&controller.reminderWord.isNotEmpty
                                  ? AppAssets.appBarBackground
                                  : AppAssets.appBarBackgroundShort),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 60, left: 18, right: 18, bottom: 13),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "  Hello Brenda!!",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.topTextColor),
                              ),
                               Text(
                                "  Today you have ${controller.list.length??[]} tasks",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.topTextColor),
                              ),
                              controller.isNeedBanner&&controller.reminderWord.isNotEmpty
                                  ? const SizedBox(
                                height: 30,
                              )
                                  : const SizedBox.shrink(),
                              controller.isNeedBanner &&controller.reminderWord.isNotEmpty
                                  ? SizedBox(
                                width: double.infinity,
                                height: 106,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.bannerColor,
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: 16),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children:  [
                                              const Text(
                                                "Today Reminder",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    color: AppColors
                                                        .topTextColor,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  controller.reminderWord.isNotEmpty?controller.reminderWord[1]:"",
                                                style: const TextStyle(
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: AppColors
                                                        .topTextColor,
                                                    fontSize: 11),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                controller.reminderWord.isNotEmpty?controller.reminderWord[0]:"",
                                                style: const TextStyle(
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: AppColors
                                                        .topTextColor,
                                                    fontSize: 11),
                                              ),
                                            ],
                                          )),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          const Image(
                                            height: 66,
                                            width: 60,
                                            image: AssetImage(
                                                AppAssets.bell),
                                            fit: BoxFit.fitWidth,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    controller
                                                        .changeBanner();
                                                  },
                                                  child: const ImageIcon(
                                                    size: 35,
                                                    AssetImage(
                                                        AppAssets.close),
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: controller.isNeedBanner&&controller.reminderWord.isNotEmpty
                        ? Get.height - 251
                        : Get.height - 115,
                    width: Get.width,
                    child: Stack(
                      children: [
                        PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          children: const [
                            HomePage(),
                            TaskPage(),
                          ],
                          onPageChanged: (index) =>
                              controller.onPageChange(index),
                        ),

                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: Get.width,
                            height: 76,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: AppColors.bottomBarbackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(136, 136, 136, 0.05),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        12, -6), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 58,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        controller
                                            .openPage(controller.menus[0]),
                                    icon: ImageIcon(
                                      size: 35,
                                      const AssetImage(AppAssets.home),
                                      color: controller.selectedMenu ==
                                          AppAssets.home
                                          ? AppColors.selectedIconColor
                                          : AppColors.unSelectedIconColor,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  InkWell(
                                    onTap: () =>
                                        controller
                                            .openPage(controller.menus[1]),
                                    child: ImageIcon(
                                      size: 35,
                                      const AssetImage(AppAssets.grid),
                                      color: controller.selectedMenu !=
                                          AppAssets.home
                                          ? AppColors.selectedIconColor
                                          : AppColors.unSelectedIconColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 58,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(

                          left: Get.width / 2 - 26.5,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              controller.clear();
                              bottom_Sheet(context, controller);
                            },
                            child: Container(
                              height: 53,
                              width: 53,
                              margin: const EdgeInsets.only(bottom: 49.73),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                      Color.fromRGBO(244, 86, 1995, 0.47),
                                      spreadRadius: 0.5,
                                      blurRadius: 3,
                                      offset: Offset(
                                          1, 7), // changes position of shadow
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(70),
                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(248, 87, 195, 1),
                                      Color.fromRGBO(224, 19, 156, 1),
                                    ], // Gra
                                  )),
                              child: const Center(
                                child: ImageIcon(
                                  size: 24.85,
                                  AssetImage(AppAssets.add),
                                  color: AppColors.bottomBarbackgroundColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
  Widget categoriesWidget(BuildContext context,List<Color>? colorList,List<String>? textList,int? indexOf) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return SizedBox(
            height: 27,
            width: Get.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: textList != null ? textList?.length : 0,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.selected(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 27,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: index == indexOf
                                      ? colorList![index]
                                      : Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor:
                                    colorList?[index] ?? Colors.blue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 10, right: 5),
                                    child: Text(
                                      textList?[index] ?? "",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: index != indexOf
                                              ? const Color(0xff8E8E8E)
                                              : Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        });
  }
  bottom_Sheet(BuildContext context, MainController controller) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SizedBox(
            height: Get.height * 0.83,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: Get.width,
                        height: Get.height * 0.8,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery
                              .of(context)
                              .viewInsets
                              .bottom,
                          right: 25,
                          left: 25,
                        ),
                        margin: const EdgeInsets.only(top: 26.5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(175, 45),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 44,
                            ),
                            const Text(
                              'Add new task',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            TextField(
                              controller: controller.textController,
                              autofocus: true,
                              showCursor: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.black),
                              cursorHeight: 32,
                              cursorColor: Colors.black,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Divider(
                              thickness: 2,
                              height: 3,
                              color: Color(0xffCFCFCF),
                            ),
                            const SizedBox(
                              height: 17.5,
                            ),
                            categoriesWidget(
                              context,
                               controller.colors,
                               controller.categories,
                               controller.selestedIndex,
                            ),
                            const SizedBox(
                              height: 17.5,
                            ),
                            const Divider(
                              thickness: 2,
                              height: 3,
                              color: Color(0xffCFCFCF),
                            ),
                            const SizedBox(
                              height: 22.5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Choose date',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                !controller.needMinute
                                    ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 70),
                                  child: InkWell(
                                    child: const Icon(Icons
                                        .keyboard_arrow_down_outlined),
                                    onTap: () async {
                                      await showRoundedDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(
                                              DateTime
                                                  .now()
                                                  .year),
                                          lastDate: DateTime(
                                              DateTime
                                                  .now()
                                                  .year + 3),
                                          borderRadius: 16,
                                          onTapDay: (DateTime dateTime,
                                              bool available) {
                                            if (DateTime
                                                .now()
                                                .month ==
                                                dateTime.month &&
                                                DateTime
                                                    .now()
                                                    .day >
                                                    dateTime.day ||
                                                DateTime
                                                    .now()
                                                    .month >
                                                    dateTime.month) {
                                              Get.snackbar("No",
                                                  "This date cannot be selected.");
                                            } else {
                                              controller.addTime(
                                                  dateTime.day,
                                                  dateTime.month);
                                            }
                                            return true;
                                          });
                                    },
                                  ),
                                )
                                    : const SizedBox(),
                              ],
                            ),
                            controller.needMinute
                                ? Row(
                              children: [
                                Text(
                                  controller.time?.day ==
                                      DateTime
                                          .now()
                                          .day &&
                                      controller.time?.month ==
                                          DateTime
                                              .now()
                                              .month
                                      ? 'Today,'
                                      : controller.time?.day ==
                                      DateTime
                                          .now()
                                          .day +
                                          1 &&
                                      controller.time?.month ==
                                          DateTime
                                              .now()
                                              .month
                                      ? "Tommorrow,"
                                      : "${controller.time?.day}.${controller
                                      .time?.month}.${controller.time?.year},",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                TimeView(
                                  onTap: () =>
                                      controller
                                          .onSelectedWorkTime(true, context),
                                  text: controller.startTime,
                                ),
                                const Text(' - ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                TimeView(
                                  onTap: () =>
                                      controller
                                          .onSelectedWorkTime(false, context),
                                  text: controller.endTime,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10),
                                  child: InkWell(
                                    child: const Icon(Icons
                                        .keyboard_arrow_down_outlined),
                                    onTap: () {
                                      controller.showtimePicker
                                          ? controller.onSelectedWorkTime(
                                          true, context)
                                          : controller.onSelectedWorkTime(
                                          false, context);
                                      controller.changeTimePicker();
                                    },
                                  ),
                                )
                              ],
                            )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 80,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {

                                  controller.storeNote(context);
                                },
                                child: SizedBox(
                                  height: 53,
                                  width: 323,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  104, 148, 238, 1),
                                              spreadRadius: 0.5,
                                              blurRadius: 3,
                                              offset: Offset(3,
                                                  6), // changes position of shadow
                                            )
                                          ],
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          gradient: const LinearGradient(
                                            colors: <Color>[
                                              Color.fromRGBO(126, 182, 255, 1),
                                              Color.fromRGBO(95, 135, 231, 1),
                                            ], // Gra
                                          )),
                                      child: const Center(
                                        child: Text(
                                          "Add task",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 53,
                        width: 53,
                        margin: EdgeInsets.only(
                            bottom: 49.73, left: Get.width / 2 - 26.5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(244, 86, 1995, 0.47),
                                spreadRadius: 0.5,
                                blurRadius: 3,
                                offset:
                                Offset(1, 7), // changes position of shadow
                              )
                            ],
                            borderRadius: BorderRadius.circular(70),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(248, 87, 195, 1),
                                Color.fromRGBO(224, 19, 156, 1),
                              ], // Gra
                            )),
                        child: const Center(
                          child: ImageIcon(
                            size: 24.85,
                            AssetImage('assets/icons/add (2).png'),
                            color: AppColors.bottomBarbackgroundColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}




