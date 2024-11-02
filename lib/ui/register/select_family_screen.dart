import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/const/text_styles.dart';
import 'package:frontend/ui/register/select_profile_screen.dart';
import 'package:frontend/ui/contents/contents_screen.dart';

class SelectFamilyScreen extends StatefulWidget {
  const SelectFamilyScreen({Key? key}) : super(key: key);

  @override
  _SelectFamilyScreenState createState() => _SelectFamilyScreenState();
}

class _SelectFamilyScreenState extends State<SelectFamilyScreen> {
  int? _selectedIndex;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            SizedBox(height: 220),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSelectableButton(0, '이미 효도링 \n가족이 있어요'),
                SizedBox(width: 20),
                _buildSelectableButton(1, '새로운 가족을\n 만들게요'),
              ],
            ),
            Expanded(child: SizedBox(),),
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContentsScreen(),
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
        child: Center(child: Text(label, textAlign: TextAlign.center)),
      ),
    );
  }
}
