import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:syber_garden/data/small_courses.dart';
import 'package:syber_garden/level_up_icons_icons.dart';
import 'package:syber_garden/screens/community_screen.dart';
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
        labelColor: const Color(0xff3ebd64),
        unselectedLabelColor: Colors.white,
        tabBarHeight: 65,
        length: 3,
        controller: tabController,
        tabBarColor: Color(0xff3d416d),
        tabs: const [
          Padding(
              padding: EdgeInsets.all(0.0),
              child: Tab(
                icon: Icon(LevelUpIcons.road),
                child: Text(
                  'Learn',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )),
          Tab(
            icon: Icon(LevelUpIcons.community),
            child: Text(
              'Сообщество',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Tab(
            icon: Icon(LevelUpIcons.user),
            child: Text(
              'Профиль',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: GFTabBarView(controller: tabController, children: const <Widget>[
        RoadMap(),
        CommunityScreen(),
        ProfileScreen(),
      ]),
    );
  }
}
