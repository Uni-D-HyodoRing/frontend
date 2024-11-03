import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/const/text_styles.dart';
import 'package:frontend/ui/register/survey_screen.dart';
import 'package:provider/provider.dart';
import 'package:frontend/provider/register_provider.dart';


class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  _SelectProfileScreenState createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  int? _selectedIndex;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    final role = index == 0 ? 'SON' : 
                 index == 1 ? 'DAUGHTER' :
                 index == 2 ? 'MOTHER' : 'FATHER';
                 
    context.read<RegisterProvider>().setMyRole(role);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text('어떤 역할이신가요?', style: TextStyles.black20bold),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSelectableButton(0, '아들'),
                SizedBox(width: 20),
                _buildSelectableButton(1, '딸'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSelectableButton(2, '엄마'),
                SizedBox(width: 20),
                _buildSelectableButton(3, '아빠'),
              ],
            ),
            Expanded(child: SizedBox(),),
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SurveyScreen(),
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

  Widget _buildSelectableButton(int index, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onButtonPressed(index),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(child: Text(label, style: TextStyles.black20bold, textAlign: TextAlign.center)),
      ),
    );
  }
}

