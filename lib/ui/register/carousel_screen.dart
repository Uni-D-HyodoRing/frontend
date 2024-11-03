import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/const/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:frontend/ui/register/info_input_screen.dart';

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // 마지막 페이지에서 버튼을 누르면 새로운 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoInputScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(  
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage1(),
                _buildPage2(),
                _buildPage3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              dotWidth: 30.0,
              dotHeight: 5.0,
              dotColor: Colors.grey,
              activeDotColor: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: Size(width * 0.8, 50),
            ),
            child: Text('다음', style: TextStyles.white16bold),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Center(child: 
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40),
      SvgPicture.asset('assets/icon/carousel1.svg', width: 42),
      const SizedBox(height: 20),
      Text('매일 전하는 안부', style: TextStyles.black20bold),
      const SizedBox(height: 20),
      Text('쌓이는 큰 마음', style: TextStyles.primary16),
      const SizedBox(height: 20),
      Text('바쁜 하루 속에서도 놓치고 싶지 않은', style: TextStyles.grey16),
Text('소중한 우리 가족과의 일상을', style: TextStyles.grey16),
    ],),);
  }

  Widget _buildPage2() {
    return Center(child: 
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40),
        SvgPicture.asset('assets/icon/carousel2.svg', width: 42),
        const SizedBox(height: 20),
        Text('사진 두 장으로', style: TextStyles.black20bold),
        const SizedBox(height: 20),
        Text('전하는 오늘의 안녕', style: TextStyles.primary16),
        const SizedBox(height: 20),
        Text('간단한 사진 전송으로 일상을 공유하고,', style: TextStyles.grey16),
        Text('AI가 일상을 추억으로 만들어드려요', style: TextStyles.grey16),
    ],),);
  }

  Widget _buildPage3() {
    return Center(child: 
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40),
      SvgPicture.asset('assets/icon/carousel3.svg', width: 42),
      const SizedBox(height: 20),
      Text('떨어져 있어도', style: TextStyles.black20bold),
      const SizedBox(height: 20),
      Text('함께 쓰는 우리 가족 이야기', style: TextStyles.primary16),
      const SizedBox(height: 20),
      Text('매일의 작은 순간들이 모여', style: TextStyles.grey16),
Text('우리 가족만의 특별한 이야기가 됩니다', style: TextStyles.grey16),
    ],),);
  }
}


