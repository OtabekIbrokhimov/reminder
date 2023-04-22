import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/data/styles/app_colors.dart';
import 'package:reminder/screens/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Image(
                          image: AssetImage('assets/icons/Group 12 (2).png')),
                      const SizedBox(
                        height: 70,
                      ),
                      const Text("Reminders made simple",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Color(0xff554E8F),
                          )),
                      const Spacer(),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>const MainPage());
                          },
                          child: SizedBox(
                            height: 53,
                            width: 323,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xff66C81C),
                                        spreadRadius: 5,
                                        blurRadius: 30,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: <Color>[
                                        Color.fromRGBO(93, 230, 26, 1),
                                        Color.fromRGBO(57, 168, 1, 1),
                                      ], // Gra
                                    )),
                                child: const Center(
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 92,
                      )
                    ],
                  )));

  }
}
