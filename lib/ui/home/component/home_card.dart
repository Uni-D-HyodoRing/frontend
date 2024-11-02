import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/safety/safety_screen.dart';

class HomeCard extends StatelessWidget {
  final String from;
  final String contents;
  final int? min;
  final String category;

  const HomeCard({
    super.key,
    required this.from,
    required this.contents,
    this.min,
    required this.category,
  });

  // from model factory constructor

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16.0,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      margin: const EdgeInsets.only(right: 16.0),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "$from의 ",
                      style: titleStyle,
                    ),
                    //아들 뭐해~ 도착
                    TextSpan(
                      text: contents,
                      style: titleStyle.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " 도착",
                      style: titleStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              if (min != null) Container(
                decoration: BoxDecoration(
                    color: const Color(0xffBDBDBD),
                    borderRadius: BorderRadius.circular(
                      4.0,
                    )),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                child: Text(
                  "${min!.toInt()}분전",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "10분 안에 오늘의 $category를 전해보세요!",
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SafetyScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff333333),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              child: Text(
                "$category 보내기",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
