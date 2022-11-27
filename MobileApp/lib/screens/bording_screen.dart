import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syber_garden/data/small_courses.dart';
import 'package:syber_garden/utils/generate_icon.dart';
import 'package:syber_garden/widgets/navigation_screens.dart';

class BordingScreen extends StatefulWidget {
  const BordingScreen({super.key});

  @override
  State<BordingScreen> createState() => _BordingScreenState();
}

class _BordingScreenState extends State<BordingScreen> {
  List list = onBordingCourse.toList();
  final controller = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212338),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/img/logo.png",
              height: 150,
              width: 150,
            ),
            const Text(
              'Рекомендательная система развития\nкомпетенций',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            !isLoading
                ? Column(
                    children: [
                      const Text(
                        'Ваша специальность?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Color(0xff373960),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff388461)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff388461)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.yellowAccent)),
                            hintText: "Введите специальность",
                            hintStyle: TextStyle(
                                fontSize: 16, color: Color(0xff737698)),
                          ),
                          controller: controller,
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CupertinoButton(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: const Color(0xff388461),
                          onPressed: () {
                            String position = controller.text;
                            GenerateIcon().genRoadMap(position).then((value) {
                              Route route = CupertinoPageRoute(
                                builder: (context) => NavigatorWidget(
                                  items: value,
                                  position: position,
                                ),
                              );
                              Navigator.pushReplacement(context, route);
                            });
                            setState(() {
                              isLoading = true;
                            });
                          },
                          child: const Text(
                            'Начать',
                            style: TextStyle(fontFamily: "Monserrat"),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: const [
                      SizedBox(width: double.infinity,),
                      CupertinoActivityIndicator(
                        radius: 24,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Пожалуйста подождите\nИдет построение карты компетенции...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
