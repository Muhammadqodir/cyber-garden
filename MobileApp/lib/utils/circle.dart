import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:syber_garden/level_up_icons_icons.dart';
import 'package:syber_garden/screens/course_details_screen.dart';
import 'package:syber_garden/utils/generate_icon.dart';

import '../data/card_courses.dart';
import '../data/circle_courses.dart';
import '../screens/road_map_screen.dart';

class Circle extends StatefulWidget {
  final String title;
  final String imgUrl;
  final int salary;
  String? activity;
  Circle(
      {super.key,
      required this.title,
      this.activity,
      required this.imgUrl,
      required this.salary});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  String? activity;
  String imgUrl = "notloaded";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GenerateIcon().getIcon(widget.title).then((value) => {
          setState(() {
            imgUrl = value;
          })
        });
  }

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
              child: imgUrl == "notloaded"
                  ? const CupertinoActivityIndicator(
                      radius: 12,
                      color: Colors.white,
                    )
                  : Image.network(
                      imgUrl,
                      color: Color.fromARGB(255, 82, 88, 150),
                      width: 40,
                      height: 40,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Color(0xFFFFC008),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        LevelUpIcons.icons8_graduation_cap,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Изучить',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Monserrat",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 30,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color(0xff28A745),
                  onPressed: () {
                    // Route route = CupertinoPageRoute(
                    //     builder: (context) => CourseDetails(
                    //         book:
                    //             '${Circle(title: widget.title).title}'));
                    // Navigator.push(context, route);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        LevelUpIcons.icons8_done,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Знаяю',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xff4b4f7f),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xff4b4f7f),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xff4b4f7f),
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
