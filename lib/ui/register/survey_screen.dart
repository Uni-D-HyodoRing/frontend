import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/const/text_styles.dart';
import 'package:frontend/ui/register/survey_result_screen.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _questions = [
    '부모님의 건강 상태에 대해 자주 관심을 갖고 물어봅니다.',
    '부모님과 주기적으로 연락을 하거나 만남을 가지려고 노력합니다.',
    '부모님께 중요한 행사나 기념일에 특별한 노력을 기울입니다.',
    '부모님의 조언이나 경험을 존중하고 귀 기울여 듣습니다.',
    '부모님의 결혼기념일이 언제인지 정확히 알고 있나요?',
    '부모님께 감사하는 마음을 자주 표현하거나 직접 말씀드립니다.',
    '부모님의 요즘 취미나 관심사가 무엇인지 알고 계신가요?',
  ];
  List<double> _responses = List.filled(7, 2.0); // 각 질문에 대한 초기 응답 값

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // 마지막 페이지에서 점수 합산 후 결과 화면으로 이동
      final totalScore = _responses.reduce((a, b) => a + b).toInt();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SurveyResultScreen(
            totalScore: totalScore,
            responses: _responses,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          SizedBox(
            width: width * 0.8,
            child: Text(
            '현재 부모님과의 연락 수준을 기반으로\n안부 빈도를 정해드려요!',
            textAlign: TextAlign.center,
            style: TextStyles.primary16,
          ),),
                    
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _questions.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    SizedBox(
                      width: width * 0.8,
                      child: Text(
                      'Q${index + 1}. ${_questions[index]}',
                      textAlign: TextAlign.center,
                      style: TextStyles.black20bold,
                    ),),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: width * 0.8,
                      child: SfSlider(
                        min: 0.0,
                        max: 4.0,
                        value: _responses[index],
                        interval: 1,
                        stepSize: 1,
                        showLabels: true,
                        activeColor: AppColors.primaryColor,
                        labelFormatterCallback: (actualValue, formattedText) {
                          switch (actualValue.round()) {
                            case 0:
                              return '전혀 아니다';
                            case 1:
                              return '아니다';
                            case 2:
                              return '보통이다';
                            case 3:
                              return '그렇다';
                            case 4:
                              return '매우 그렇다';
                            default:
                              return formattedText;
                          }
                        },
                        onChanged: (dynamic value) {
                          setState(() {
                            _responses[index] = value.roundToDouble();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: _questions.length,
            effect: WormEffect(
              activeDotColor: AppColors.primaryColor,
              dotWidth: 8.0,
              dotHeight: 8.0,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(width * 0.8, 50),
              ),
              child: Text(
                _currentPage < _questions.length - 1 ? '다음' : '결과 보기',
                style: TextStyles.white16bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
