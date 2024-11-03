import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/const/text_styles.dart';
import 'dart:async';
import 'package:frontend/ui/register/carousel_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CarouselScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [SvgPicture.asset('assets/logo.svg', width: 100),
            const SizedBox(height: 20),
            Text('효도링', style: TextStyles.logoTitle),
        ],),
      ),
    );
  }
}