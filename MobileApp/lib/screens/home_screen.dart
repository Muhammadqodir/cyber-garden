import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syber_garden/screens/course_details_screen.dart';
import 'package:syber_garden/data/card_courses.dart';
import 'package:syber_garden/data/small_courses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  List<Book> books = allBooks;
  List<CardCourse> cardCourse = allCardCourse;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: const Color(0xff212338),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(
                                71, 255, 255, 255)), //<-- SEE HERE
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'Поиск курсов',
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Colors.white))),
                  onChanged: searchBook,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 139, 141, 177)),
                            image: DecorationImage(
                                image: AssetImage(book.urlImage),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.bottomCenter,
                        width: 100,
                        height: 100,
                        child: Text(
                          book.title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CourseDetails(book: 'fd'),
                              )),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, top: 20),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Новые крусы',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        const Text(
                          'Все',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '57 курсов',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 180,
                      width: 380,
                      child: CarouselSlider.builder(
                        itemCount: cardCourse.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          final cardCours = cardCourse[itemIndex];
                          return Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                            Text(cardCours.members,
                                                style: const TextStyle(
                                                    color: Colors.grey)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              cardCours.raiting,
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
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
                                  height: 5,
                                ),
                                Text(
                                  cardCours.price,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          aspectRatio: 1.0,
                          initialPage: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    setState(() => books = suggestions);
  }
}
