import 'package:flutter/material.dart';
import 'package:frontend/ui/common/components/posting_title.dart';
import 'package:frontend/ui/common/style/box_decoration.dart';

class PostingComment extends StatelessWidget {
  final String name;
  final String date;
  final String comment;

  const PostingComment({
    super.key,
    required this.name,
    required this.date,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: postingBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostingTitle(
            name: name,
            date: date,
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              comment,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
