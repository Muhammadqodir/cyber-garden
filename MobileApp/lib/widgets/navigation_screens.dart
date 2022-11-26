import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:syber_garden/data/small_courses.dart';
import 'package:syber_garden/screens/home_screen.dart';
import 'package:syber_garden/screens/profile_screen.dart';
import '../screens/road_map_screen.dart';
import 'package:getwidget/getwidget.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Book> books = allBooks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212338),
      bottomNavigationBar: GFTabBar(
        indicatorColor: Colors.transparent,
        labelColor: Color(0xff3ebd64),
        unselectedLabelColor: Colors.grey,
        tabBarHeight: 65,
        length: 3,
        controller: tabController,
        tabBarColor: Color(0xff3d416d),
        tabs: [
          Padding(
              padding: const EdgeInsets.all(0.0),
              child: Tab(
                icon: Image(
                  width: 20,
                  height: 20,
                  image: Svg(
                    'assets/icons/road.svg',
                  ),
                ),
                child: const Text(
                  'Learn',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )),
          Tab(
            icon: Image(
              width: 20,
              height: 20,
              image: Svg(
                'assets/icons/community.svg',
              ),
            ),
            child: const Text(
              'Community',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Tab(
            icon: Image(
              width: 20,
              height: 20,
              image: Svg(
                'assets/icons/user.svg',
              ),
            ),
            child: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: GFTabBarView(controller: tabController, children: <Widget>[
        HomeScreen(),
        RoadMap(),
        ProfileScreen(),
      ]),
    );
  }
}
