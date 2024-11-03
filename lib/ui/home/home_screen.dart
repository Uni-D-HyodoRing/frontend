import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/common/components/posting_card.dart';
import 'package:frontend/ui/home/component/home_card.dart';
import 'package:frontend/ui/home/component/score_ring.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Child(),
      ),
    );
  }
}

class Parent extends StatelessWidget {
  const Parent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: _Top(),
        ),
        SliverToBoxAdapter(
          child: _Title(
            title: "부모님",
            text: "자식들은 오늘 어떤 하루를 보냈을까요?",
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150.0,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return HomeCard(
                  from: "김만두 아드님",
                  contents: "저녁 뭐 드세요?",
                  min: 3,
                  category: "안부",
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150.0,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return HomeCard(
                  from: "김만두 아드님",
                  contents: "저녁 뭐 드세요?",
                  category: "안부",
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150.0,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return HomeCard(
                  from: "김만두 아드님",
                  contents: "저녁 뭐 드세요?",
                  category: "안부",
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return PostingCard(
                name: "엄마",
                date: "2024.11.02",
                content: "따뜻했던 토요일의 기록",
              );
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }
}

class Child extends StatelessWidget {
  const Child({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _Top(),
          const SizedBox(height: 16.0),
          _Title(
            title: "전설의 효자, 김만두님!",
            text: "오늘도 부모님께 안부 메시지를 전달해보아요",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: ScoreRing(score: 80),
          ),
          SizedBox(
            height: 150,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return HomeCard(
                  from: "어머님",
                  contents: "아들 뭐해~",
                  min: 3,
                  category: "안부",
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 150,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return HomeCard(
                  from: "어머님",
                  contents: "아들 뭐해~",
                  min: 3,
                  category: "안부",
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 150,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return HomeCard(
                  from: "어머님",
                  contents: "아들 뭐해~",
                  min: 3,
                  category: "안부",
                );
              },
            ),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            "assets/icon/camera.svg",
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 16.0),
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String text;

  const _Title({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              Text(text),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            onPressed: () {},
            child: const Text(
              "모든 알람 확인>",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
