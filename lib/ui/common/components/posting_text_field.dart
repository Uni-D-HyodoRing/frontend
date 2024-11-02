import 'package:flutter/material.dart';
import 'package:frontend/ui/common/style/text_style.dart';

class PostingTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool isPosting;

  const PostingTextField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.isPosting = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
