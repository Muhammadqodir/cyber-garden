import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
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
      backgroundColor: const Color(0xff36395f),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/img/banner.png"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff212338),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            child: Container(
              color: Color(0xff36395f),
              margin: const EdgeInsets.only(top: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Image(
                            width: 20,
                            height: 20,
                            image: Svg(
                              'assets/icons/icons8-edit.svg',
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Бухгалтерия',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Expanded(child: Container()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: SizedBox(
                          width: 175,
                          child: GFProgressBar(
                            percentage: e.progress,
                            lineHeight: 10,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading: Image(
                              width: 20,
                              height: 20,
                              color: Colors.grey,
                              image: Svg(
                                'assets/icons/crown.svg',
                              ),
                            ),
                            trailing: Image(
                              width: 20,
                              height: 20,
                              color: Color(0xffffd531),
                              image: Svg(
                                'assets/icons/crown.svg',
                              ),
                            ),
                            backgroundColor: Colors.black26,
                            progressBarColor: GFColors.SUCCESS,
                          ),
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
          ),
        ],
      ),
    );
  }
}
