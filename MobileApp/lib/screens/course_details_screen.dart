import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syber_garden/utils/generate_icon.dart';

import '../data/card_courses.dart';

class CourseDetails extends StatefulWidget {
  final String title;
  const CourseDetails({
    super.key,
    required this.title,
  });

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  List<Widget> cardCourse = [];
  @override
  void initState() {
    super.initState();
    log("Loading...");
    GenerateIcon().getCards(widget.title).then((value) => {
          setState(() {
            cardCourse = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff212338),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff3d416d),
          automaticallyImplyLeading: true,
          title: Text(widget.title),
          centerTitle: true,
          // actions: const [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 15),
          //     child: Icon(CupertinoIcons.settings),
          //   ),
          // ],
        ),
        body: ListView(
          children: cardCourse,
        ));
  }
}
