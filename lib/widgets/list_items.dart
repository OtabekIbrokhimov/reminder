import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:reminder/controllers/main_page_controller.dart';
import 'package:reminder/data/styles/app_assets.dart';
import 'package:reminder/widgets/time_view.dart';

import '../data/styles/app_colors.dart';

class SwipeView extends StatelessWidget {
  final Function(BuildContext context)? delete;
  final Function(BuildContext context)? edit;
  final DateTime? dateTime;
  final String? content;
  final String? time;
  final int? colorIndex;
   SwipeView({
    Key? key,
    this.delete,
     this.dateTime,
    this.edit,
    this.content,
    this.time,
     this.colorIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
    builder: (controller) {
    return Column(children: [

      Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            children: [
              const SizedBox(
                width: 9,
              ),
              SizedBox(
                height: 55.21,
                width: 40,
                child: Center(
                  child: InkWell(
                    onTap: () {controller.edit(content!);
                      bottom_Sheet(context, controller);
                      },
                    child: const CircleAvatar(
                      radius: 17.5,
                      backgroundColor: Color(0xffC4CEF5),
                      child: Image(image: AssetImage(AppAssets.edit)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                width: 40,
                child: Center(
                  child: InkWell(
                    onTap: () {controller.remove(dateTime!);
                    Slidable.of(context)?.close(duration: const Duration(milliseconds: 20));
                      },
                    child: const CircleAvatar(
                      radius: 17.5,
                      backgroundColor: Color(0xffFFCFCF),
                      child: Image(image: AssetImage(AppAssets.delete)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: DecoratedBox(
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.03),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(9, 4), // changes position of shadow
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 55.21,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(
                        height: 55.21,
                        width: 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: controller.colors[colorIndex??0]??Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55.21,
                        width: 44,
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: DecoratedBox(
                                decoration: int.parse("${dateTime?.hour}") <=DateTime.now().hour&&int.parse("${dateTime?.day}") <= DateTime.now().day&& int.parse("${dateTime?.month}")<DateTime.now().month? BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffDADADA),
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(40),
                                    image: const DecorationImage(
                                        image: AssetImage(AppAssets.checked))):BoxDecoration(
      border: Border.all(
      color: const Color(0xffDADADA),
      width: 1.5),
      borderRadius: BorderRadius.circular(40),
      )
                              ),
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        child: Text(
                          "${dateTime?.hour}:${dateTime?.minute}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xffC6C6C8)),
                        ),
                      ),
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                        child: Text(
                          content??"",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xffC6C6C8)),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 55.21,
                        width: 30,
                        child: Center(
                          child: InkWell(
                              onTap: () {},
                              child: const Image(
                                  image: AssetImage(AppAssets.bellIcon))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
      const SizedBox(
        height: 13.79,
      )
    ]);});
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
                            AssetImage(AppAssets.add),
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

  Widget categoriesWidget(BuildContext context, List<Color>? colorList,
      List<String>? textList, int? indexOf) {
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
}
