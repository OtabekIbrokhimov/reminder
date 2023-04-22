import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/controllers/main_page_controller.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
    builder: (controller) {
    return  Scaffold(
        body: SingleChildScrollView(
      physics:  NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 18),
              child: SizedBox(
                  height: Get.height-330,
                  width: Get.width,
                  child: GridView.builder(
                  //  physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 190,
                          width: 170,
                          margin: const EdgeInsets.only(right: 18, top: 18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffBBBBBB),
                                spreadRadius: 0,
                                blurRadius: 11,
                                offset: Offset(7, 0), // changes position of shadow
                              )
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                               CircleAvatar(
                                radius: 33,
                                backgroundColor: controller.colors2[index],
                                child:  Image(
                                    image: AssetImage(
                                        controller.icons[index])),
                              ),
                              Text(controller.categories[index], style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xff686868)),),
                              const SizedBox(height: 30,),
                              const Text("24 Task", style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: Color(0xffA1A1A1)),),

                            ],
                          ),
                        );
                      })))
        ],
      ),
    ));});
  }
}
