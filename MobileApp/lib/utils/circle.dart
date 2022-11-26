import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:syber_garden/screens/course_details_screen.dart';

import '../data/card_courses.dart';
import '../data/circle_courses.dart';
import '../screens/road_map_screen.dart';

class Circle extends StatefulWidget {
  final String title;
  String? activity;
  Circle({super.key, required this.title, this.activity});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  String? activity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              color: widget.activity == 'false'
                  ? const Color(0xff141522)
                  : const Color(0xff3d416d),
              shape: BoxShape.circle,
              border: Border.all(
                  color: widget.activity == 'false'
                      ? Color.fromARGB(0, 0, 0, 0)
                      : const Color(0xff4b4f7f),
                  width: 10),
            ),
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Image(
                color: widget.activity == 'false'
                    ? Color(0xff43444e)
                    : Color.fromARGB(255, 161, 163, 179),
                image: widget.activity == 'false'
                    ? Svg(
                        'assets/icons/lock.svg',
                      )
                    : Svg(
                        'assets/icons/star.svg',
                      ),
                width: 30,
                height: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '${Circle(title: widget.title).title}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          widget.activity == 'true'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: Color.fromARGB(144, 255, 214, 49),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 12,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'дальше',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 30,
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: Color(0xff388461),
                        onPressed: () {
                          Route route = CupertinoPageRoute(
                              builder: (context) => CourseDetails(
                                  book:
                                      '${Circle(title: widget.title).title}'));
                          Navigator.push(context, route);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 12,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'изучать',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.more_vert,
            size: 50,
            color: const Color(0xff4b4f7f),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
