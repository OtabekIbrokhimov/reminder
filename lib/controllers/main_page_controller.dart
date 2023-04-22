
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/data/tools/database_hive.dart';
import 'package:reminder/models/activity_model.dart';
import 'package:reminder/widgets/dateTime_picker.dart';

import '../data/styles/app_assets.dart';

class MainController extends GetxController {

  List<Color> colors = [
    const Color(0xffFFD506),
    const Color(0xff1ED102),
    const Color(0xffD10263),
    const Color(0xff1ED102),
    const Color(0xff686868),
    const Color(0xffF59BFF)
  ];
  List<Color> colors2 = [
    const Color(0xffFFEE9B),
    const Color(0xffB5FF9B),
    const Color(0xffFF9BCD),
    const Color(0xffFFD09B),
    const Color(0xff9BFFF8),
    const Color(0xffF59BFF)
  ];
  List<String> icons = [
    "assets/icons/user.png",
    "assets/icons/briefcase.png",
    "assets/icons/presentation (1).png",
    "assets/icons/shopping-basket.png",
    "assets/icons/confetti.png",
    "assets/icons/molecule.png"
  ];
  List<String> categories = [
    "Personal",
    "Work",
    "Meeting",
    "Shooping",
    "Party",
    "Study"
  ];
  PageController pageController = PageController();
  final List<String> menus = [AppAssets.home, AppAssets.grid];
  bool isNeedBanner = true;
  bool showtimePicker = true;
  int currentPage = 0;
  String selectedMenu = '';
  DateTime? time;
  bool needMinute = false;
  var startDate = DateTime.now();
  var endDate = DateTime.now();
  String startTime = '00:00';
  String endTime = '00:00';
  int selestedIndex = 0;
  List <String> reminderWord = [];
  void addTime(int day, int month) {
    time = DateTime(DateTime.now().year, month, day);
    Get.log("${time?.day}");
    needMinute = true;
    update();
  }
 void edit(String content){
    textController.text = content;
    needMinute = false;
    update();
 }
  void selected(int index) {
    Get.log(index.toString() * 100);
    selestedIndex = index;
    update();
  }

  void onSelectedWorkTime(bool isStart, BuildContext context) {
    dateTimePicker1(context, isStart,
        (bool isStart, DateTime time) => pickDate(isStart, time));

    time = DateTime(
        time?.year ?? 0,
        time?.month ?? 0,
        time?.day ?? 0,
        int.parse(startTime.substring(0, 2)),
        int.parse(startTime.substring(3, 5)));
  }

  void changeTimePicker() {
    showtimePicker = !showtimePicker;
  }

  List<Notes> list = [];
  bool isSelected = false;
  TextEditingController textController = TextEditingController();

  Future<void> storeNote(BuildContext context) async {
    String title = "work";
    String content = textController.text.toString();
    Notes note = Notes(
        colorIndex: selestedIndex,
        title: categories[selestedIndex],
        content: content,
        starTime: time);
    Get.log(note.content.toString());
    List<Notes> noteList = DBService.loadNotes();
    noteList.add(note);
    Get.log(noteList[0].content ?? "no");
    await DBService.storeNotes(noteList);
    filter(noteList);
    noteList.clear();
    loadDate();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
void clear(){
    textController.text = '';
    selestedIndex = 0;
    time = DateTime(2023);
    startTime = "00:00";
    endTime = "00:00";
    needMinute = false;
    update();
  }


  void pickDate(bool isStart, DateTime time) {
    isStart
        ? {startDate = time, startTime = startDate.toString().substring(11, 16)}
        : {endDate = time, endTime = endDate.toString().substring(11, 16)};
    update();
  }

  @override
  void onInit() {
    list = DBService.loadNotes() ?? [];
    filter(list);
    if (list.isNotEmpty) {
      empty = true;
    }else{
      isNeedBanner = false;
    }
    selectedMenu = menus.first;
    super.onInit();
  }

  void changeBanner() {
    isNeedBanner = !isNeedBanner;
    update();
  }

  void openPage(String menu) {
    selectedMenu = menu;
    var index = menus.indexOf(menu);
    Get.log(index.toString());
    currentPage = index;
    pageController.jumpToPage(index);
    update();
  }

  void onPageChange(int index) {
    selectedMenu = menus[index];
    currentPage = index;
    Get.log(currentPage.toString());
    pageController.jumpToPage(index);
    update();
  }
  List<Notes> today = [];
  List<Notes> tomorrow = [];
  List<Notes> morethan2 = [];

  bool empty = false;

  Future<void> loadDate()async{
    Get.log("mana");
    list.clear();
    list =  DBService.loadNotes();
    filter(list);
    update();
  }
  Future<void> remove( DateTime time)async{
    list.removeWhere((element) => element.starTime == time);
   await DBService.removeNotes();
   await DBService.storeNotes(list);
   today.clear();
   tomorrow.clear();
   morethan2.clear();
    loadDate();

  }

  void filter(List<Notes> list) {
    today.clear();
    tomorrow.clear();
    morethan2.clear();
    for (int i = 0; i < list.length; i++) {
      bool needIt = true;
      if (DateTime.now().month == list[i].starTime?.month &&
          DateTime.now().year == list[i].starTime?.year &&
          DateTime.now().day == list[i].starTime?.day) {
        today.add(list[i]);
        if(DateTime.now().hour < int.parse("${list[i].starTime?.hour}")&&needMinute||DateTime.now().minute < int.parse("${list[i].starTime?.minute}")&&needMinute){
          reminderWord.add("${list[i].starTime?.hour}:${list[i].starTime?.minute}");
          reminderWord.add(list[i].content!);
        }
      }
      if (DateTime.now().month == list[i].starTime?.month &&
          DateTime.now().year == list[i].starTime?.year &&
          DateTime.now().day + 1 == list[i].starTime?.day) {
        tomorrow.add(list[i]);
      } else {
        morethan2.add(list[i]);
      }
      update();
    }

    update();
    // TODO: implement onInit
    super.onInit();
  }
}
