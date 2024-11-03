import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/provider/user_provider.dart';
import 'package:frontend/ui/register/splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frontend/provider/register_provider.dart';

// flutter_local_notifications 플러그인 초기화
final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

// 백그라운드 메시지 처리 핸들러
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  _showNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Pretendard",
      ),
      home: SplashScreen(),
    );
  }
}

// 알림 표시 함수
Future<void> _showNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'high_importance_channel', // AndroidManifest.xml에 지정한 채널 ID와 동일하게 설정
    'High Importance Notifications', // 채널 이름
    importance: Importance.high,
    priority: Priority.high,
    showWhen: false,
  );
  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  await _local.show(
    0, // 알림 ID
    message.notification?.title,
    message.notification?.body,
    platformChannelSpecifics,
    payload: '알림을 클릭했을 때의 데이터',
  );
}

FlutterLocalNotificationsPlugin get localNotificationsPlugin => _local;
