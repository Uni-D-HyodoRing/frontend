import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/const/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:frontend/ui/register/select_family_screen.dart';
import 'package:frontend/ui/register/select_profile_screen.dart';

class InfoInputScreen extends StatefulWidget {
  const InfoInputScreen({super.key});

  @override
  _InfoInputScreenState createState() => _InfoInputScreenState();
}

class _InfoInputScreenState extends State<InfoInputScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _passwordController.dispose();
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('기본 정보 입력', style: TextStyles.black20bold),),
            SizedBox(height: 16),
            Text('이름'),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: '이름을 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),),
              ),
            ),
            SizedBox(height: 16),
            Text('생년월일'),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _yearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '연도',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                        
                      ),
                      enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _monthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '월',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _dayController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '일',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('아이디'),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                hintText: '아이디를 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),),
              ),
              
            ),
            SizedBox(height: 16),
            Text('비밀번호'),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: '비밀번호를 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),),
              ),
            ),
            Expanded(child: SizedBox(),),
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SelectProfileScreen(),
                ),
              );
            },
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
      ),
    );
  }
}
