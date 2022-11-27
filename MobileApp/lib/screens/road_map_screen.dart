import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:syber_garden/screens/bording_screen.dart';
import '../data/circle_courses.dart';
import '../utils/circle.dart';

class RoadMap extends StatefulWidget {
  final List<Circle> roadMap;
  final String position;
  const RoadMap({super.key, required this.roadMap, required this.position});

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
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage("assets/img/banner.png"),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff212338),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.roadMap),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                color: const Color(0xff36395f),
                margin: const EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Route route = CupertinoPageRoute(
                            builder: (context) => const BordingScreen());
                        Navigator.pushReplacement(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text(
                                widget.position,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image(
                              width: 20,
                              height: 20,
                              image: Svg(
                                'assets/icons/icons8-edit.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
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
                              leading: const Image(
                                width: 20,
                                height: 20,
                                color: Colors.grey,
                                image: Svg(
                                  'assets/icons/crown.svg',
                                ),
                              ),
                              trailing: const Image(
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
                            SizedBox(
                              width: 200,
                              child: Center(
                                  child: Text(
                                '${e.progress * 100.floor()}%',
                                style: const TextStyle(color: Colors.white),
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
      ),
    );
  }
}
