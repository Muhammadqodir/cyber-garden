import 'package:flutter/material.dart';
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
                  ? Color.fromARGB(128, 0, 0, 0)
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
                  image: NetworkImage(widget.activity == 'false'
                      ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lock-icon.svg/1200px-Lock-icon.svg.png'
                      : 'https://cdn-icons-png.flaticon.com/512/178/178365.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => CourseDetails(
                            book: widget.title,
                          ));
                  Navigator.push(context, route);
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Изучить',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'След',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Icon(
            Icons.more_vert,
            size: 50,
            color: const Color(0xff4b4f7f),
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
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
