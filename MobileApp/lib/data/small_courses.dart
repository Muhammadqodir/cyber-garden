class Book {
  final String title;
  final String urlImage;

  const Book({required this.title, required this.urlImage});
}

const allBooks = [
  Book(
    title: 'Python',
    urlImage: 'assets/img/flutter.jpg',
  ),
  Book(
    title: 'Java script',
    urlImage: 'assets/img/js.jpg',
  ),
  Book(
    title: 'Java',
    urlImage: 'assets/img/java.jpg',
  ),
  Book(
    title: 'Flutter',
    urlImage: 'assets/img/kotlin.jpg',
  ),
  Book(
    title: 'Kotlin',
    urlImage: 'assets/img/flutter.jpg',
  ),
  Book(
    title: 'Java',
    urlImage: 'assets/img/flutter.jpg',
  ),
];

final onBordingCourse = [
  'Flutter',
  'C++',
  'Python',
];
