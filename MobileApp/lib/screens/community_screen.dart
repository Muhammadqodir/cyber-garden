import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141522),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff3d416d),
        automaticallyImplyLeading: false,
        title: const Text('Сообщество'),
        centerTitle: true,
        // actions: const [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 15),
        //     child: Icon(CupertinoIcons.settings),
        //   ),
        // ],
      ),
      body: const Center(
        child: Text(
          'В разработке...',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
