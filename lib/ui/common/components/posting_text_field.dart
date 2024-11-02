import 'package:flutter/material.dart';
import 'package:frontend/ui/common/style/text_style.dart';

class PostingTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool isPosting;
  final TextEditingController? controller;

  const PostingTextField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.isPosting = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: isPosting ? contentTextStyle : commentTextStyle,
      onChanged: onChanged,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: isPosting ? contentTextStyle : commentTextStyle,
        focusedBorder: const UnderlineInputBorder(),
      ),
    );
  }
}
