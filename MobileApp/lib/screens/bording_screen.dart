import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:syber_garden/data/small_courses.dart';
import 'package:syber_garden/widgets/navigation_screens.dart';

class BordingScreen extends StatefulWidget {
  const BordingScreen({super.key});

  @override
  State<BordingScreen> createState() => _BordingScreenState();
}

class _BordingScreenState extends State<BordingScreen> {
  List list = onBordingCourse.toList();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212338),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 150, left: 15, right: 15, bottom: 25),
              width: 150,
              height: 150,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Выберите направление',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xff373960),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.green),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Color(0xff388461)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Color(0xff388461)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(width: 2, color: Colors.yellowAccent)),
                  hintText: "Поиск профессии",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xff737698)),
                ),
                controller: controller,
                obscureText: false,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoButton(
                color: Color(0xff388461),
                onPressed: () {
                  Route route = CupertinoPageRoute(
                      builder: (context) => NavigatorWidget());
                  Navigator.push(context, route);
                },
                child: const Text('Enabled'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
