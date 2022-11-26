import 'package:flutter/material.dart';
import 'package:syber_garden/data/small_courses.dart';

class CourseDetails extends StatelessWidget {
  final String book;
  const CourseDetails({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book),
      ),
    );
  }
}
