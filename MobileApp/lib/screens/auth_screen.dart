import 'package:flutter/material.dart';
import '../widgets/navigation_screens.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212338),
      body: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 164, bottom: 24, right: 24, left: 24),
        color: const Color(0xff212338),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/img/LoginImg.png')),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Escape the ordinary life',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Discover great experiences around you \nand make you live interesting!',
              style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                  color: Color(0xffD6D2D2)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 107,
            ),
            Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 52,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3d416d),
                      ),
                      onPressed: () {},
                      child: const Text('Get Started',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xff031F2B)))),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 52,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xff3d416d),
                        side: BorderSide(
                          color: const Color(0xff5EDFFF).withOpacity(0.6),
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigatorWidget()),
                        );
                      },
                      child: const Text('Log In',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xff5EDFFF)))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
