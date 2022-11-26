import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syber_garden/data/small_courses.dart';
import 'package:syber_garden/screens/road_map_screen.dart';
import 'package:syber_garden/widgets/navigation_screens.dart';

class BordingScreen extends StatefulWidget {
  const BordingScreen({super.key});

  @override
  State<BordingScreen> createState() => _BordingScreenState();
}

class _BordingScreenState extends State<BordingScreen> {
  final controller = TextEditingController();
  List<Book> books = allBooks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212338),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 150, left: 15, right: 15, bottom: 25),
              width: 150,
              height: 150,
              color: Colors.amber,
            ),
            const Text(
              'Выберите направление',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 30, bottom: 20),
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.white))),
                  onChanged: searchBook,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => NavigatorWidget());
                Navigator.push(context, route);
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xff3d416d),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Начать',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
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
