import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

import '../data/circle_courses.dart';
import '../utils/circle.dart';

class RoadMap extends StatefulWidget {
  const RoadMap({
    super.key,
  });

  @override
  State<RoadMap> createState() => _RoadMapState();
}

class _RoadMapState extends State<RoadMap> {
  List<CircleCourse> books = allCircleCourse;

  @override
  Widget build(BuildContext context) {
    final e = books[0];

    return Scaffold(
      backgroundColor: const Color(0xff212338),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text(
                        'Бухгалтерия',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Container()),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: GFProgressBar(
                            percentage: e.progress,
                            lineHeight: 10,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading: Icon(Icons.sentiment_dissatisfied,
                                color: GFColors.DANGER),
                            trailing: Icon(Icons.sentiment_satisfied,
                                color: GFColors.SUCCESS),
                            backgroundColor: Colors.black26,
                            progressBarColor: GFColors.SUCCESS,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 200,
                              child: Center(
                                  child: Text(
                                '${e.progress * 100.floor()}%',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/LoginImg.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff212338),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35))),
                    child: Column(
                      children: books
                          .map(
                            (e) => Circle(
                              title: e.title,
                              activity: e.activity,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
