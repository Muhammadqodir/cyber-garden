import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/card_courses.dart';

class CourseDetails extends StatelessWidget {
  final String book;
  const CourseDetails({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    List<CardCourse> cardCourse = allCardCourse;
    return Scaffold(
        backgroundColor: Color(0xff212338),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3d416d),
          automaticallyImplyLeading: false,
          title: Text(book),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
          child: ListView.builder(
            itemCount: cardCourse.length,
            itemBuilder: (context, int index) {
              final cardCours = cardCourse[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: 390,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 49, 52, 95),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(cardCours.urlImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardCours.title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                cardCours.description,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image(
                            width: 30,
                            height: 30,
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/1384/1384060.png'),
                            fit: BoxFit.cover,
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            height: 30,
                            child: CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: Color.fromARGB(144, 255, 214, 49),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'информация',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 30,
                            child: CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: Color(0xff388461),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow_outlined,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'начать',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
