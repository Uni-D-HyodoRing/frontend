import 'package:flutter/material.dart';
import 'package:frontend/const/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class ContentsScreen extends StatelessWidget {
  const ContentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Text('콘텐츠', style: TextStyles.black20bold),),
          Divider(),
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('🎁 선물하기', style: TextStyles.black16bold),
                Text('더보기 >', style: TextStyles.grey10)],),
              SizedBox(height: 5),
              Text('AI가 부모님 맞춤 선물을 추천해줬어요.', style: TextStyles.grey10),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(children: [Image.asset('assets/icon/gift_cake.png', width: 64), Text('생일')],),
                Column(children: [Image.asset('assets/icon/gift_so.png', width: 64), Text('한우')],),
                Column(children: [Image.asset('assets/icon/gift_fruit.png', width: 64), Text('과일')],),
                Column(children: [Image.asset('assets/icon/gift_vitamin.png', width: 64), Text('비타민')],),
              ],),

            ],),
          ),
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('오늘의 콘텐츠', style: TextStyles.black16bold),
                Text('더보기 >', style: TextStyles.grey10)],),
              SizedBox(height: 5),
              Text('AI가 부모님 맞춤 선물을 추천해줬어요.', style: TextStyles.grey10),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],),
                
                child: Row(children: [
                  Image.asset('assets/icon/today.png', width: 20),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('오늘의 운세! 🍀', style: TextStyles.black14),
                    Text('오늘의 운세를 확인하고 안부를 함께 전해보세요.', style: TextStyles.grey10),
                  ],),
                ],),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],),
                
                child: Row(children: [
                  Image.asset('assets/icon/book.png', width: 20),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('명언 한 말씀', style: TextStyles.black14),
                    Text('오늘을 살아갈 용기를 명언을 통해 전해보세요', style: TextStyles.grey10),
                  ],),
                ],),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],),
                
                child: Row(children: [
                  Image.asset('assets/icon/flame.png', width: 20),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('미니게임', style: TextStyles.black14),
                    Text('부모님과 함께 미니게임을 즐겨보세요', style: TextStyles.grey10),
                  ],),
                ],),
              ),
            ],),
          ),
        ],
      ),
    );
  }
}
