import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/common/components/custom_divider.dart';
import 'package:frontend/ui/common/style/box_decoration.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "설정",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(
                color: AppColors.strokeColor,
              ),
            ),
            Container(
              decoration: postingBoxDecoration,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "알림 설정",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const _Line(text: "안부 알림"),
                  const _Line(text: "메시지 알림"),
                  const _Line(text: "일기 알림"),
                  const CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "앱 버전",
                        style: versionTextStyle,
                      ),
                      Text(
                        "1.0.0",
                        style: versionTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16.0
            ),
            Container(
              decoration: postingBoxDecoration,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "계정 설정",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  _Line(text: "프로필 수정", label: "수정하기"),
                  _Line(text: "개인 정보 설정"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle versionTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: AppColors.darkGrey,
  fontSize: 16.0,
);

class _Line extends StatelessWidget {
  final String text;
  final String label;

  const _Line({
    required this.text,
    this.label = "설정하기",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(color: AppColors.strokeColor),
              ),
            ),
            child: Text(label),
          )
        ],
      ),
    );
  }
}
