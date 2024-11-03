import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';

class PostingTitleAvatar extends StatelessWidget {
  const PostingTitleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.darkGrey,
      child: const Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }
}
