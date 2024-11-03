import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/const/text_styles.dart';
import 'dart:async';
import 'package:frontend/ui/register/carousel_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:frontend/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    super.initState();
    _permissionWithNotification();
    _initialization();

    Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CarouselScreen(),
        ),
      );
    });
  }

   // 로컬 알림 초기화
   void _initialization() async {
     const AndroidInitializationSettings android =
     AndroidInitializationSettings("@mipmap/ic_launcher");
     const DarwinInitializationSettings ios = DarwinInitializationSettings(
       requestSoundPermission: false,
       requestBadgePermission: false,
       requestAlertPermission: false,
     );
     const InitializationSettings settings =
     InitializationSettings(android: android, iOS: ios);
     await localNotificationsPlugin.initialize(settings);
   }

   // 알림 권한 요청
   void _permissionWithNotification() async {
     var status = await Permission.notification.status;
     if (!status.isGranted) {
       await Permission.notification.request();
     }
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