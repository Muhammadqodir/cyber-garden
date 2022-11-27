class CircleCourse {
  final String activity;
  final String title;
  final String urlImage;
  final double progress;

  const CircleCourse(
      {required this.activity,
      required this.title,
      required this.urlImage,
      required this.progress});
}

const allCircleCourse = [
  CircleCourse(
    title: 'Python',
    urlImage: 'https://cdn-icons-png.flaticon.com/128/1822/1822920.png',
    activity: 'true',
    progress: 0.01,
  ),
  CircleCourse(
    title: 'Java script',
    urlImage: 'assets/img/js.jpg',
    activity: 'false',
    progress: 0.1,
  ),
  CircleCourse(
    title: 'Java',
    urlImage: 'assets/img/java.jpg',
    activity: 'false',
    progress: 0.1,
  ),
  CircleCourse(
    title: 'Flutter',
    urlImage: 'assets/img/kotlin.jpg',
    activity: 'false',
    progress: 0.1,
  ),
  CircleCourse(
    title: 'Kotlin',
    urlImage: 'assets/img/flutter.jpg',
    activity: 'false',
    progress: 0.1,
  ),
  CircleCourse(
    title: 'Java',
    urlImage: 'assets/img/flutter.jpg',
    activity: 'false',
    progress: 0.1,
  ),
];
