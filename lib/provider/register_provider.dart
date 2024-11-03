import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RegisterProvider with ChangeNotifier {
  String? loginId;
  String? loginPw;
  String? name;
  String? birth;
  String? myRole;

  final Dio _dio = Dio()..interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => print('🌐 $object'),
    ),
  );

  void setLoginId(String value) {
    loginId = value;
    notifyListeners();
  }

  void setLoginPw(String value) {
    loginPw = value;
    notifyListeners();
  }

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setBirth(String value) {
    birth = value;
    notifyListeners();
  }

  void setMyRole(String value) {
    myRole = value;
    notifyListeners();
  }

  Future<bool> register() async {
    try {
      final response = await _dio.post(
        'https://a043-123-212-9-154.ngrok-free.app/register',
        data: {
          'loginId': loginId,
          'loginPw': loginPw,
          'name': name,
          'birth': birth,
          'myRole': myRole,
        },
      );
      
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print('회원가입 에러: $e');
      return false;
    }
  }
} 