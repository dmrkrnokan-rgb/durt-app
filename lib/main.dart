import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/svg/bg_main.svg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/svg/logo_main.svg',
                width: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
