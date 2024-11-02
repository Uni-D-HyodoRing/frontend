import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/common/components/custom_divider.dart';
import 'package:frontend/ui/common/components/posting_title.dart';
import 'package:frontend/ui/common/style/box_decoration.dart';
import 'package:frontend/ui/common/style/text_style.dart';

class PostingCard extends StatelessWidget {
  final String name;
  final String date;
  final String content;
  final bool detail;

  const PostingCard({
    super.key,
    required this.name,
    required this.date,
    this.content = "",
    this.detail = false,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              content,
              style: contentTextStyle,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _ImageBox(detail: detail),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _ImageBox(detail: detail),
              ),
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: AppColors.darkGrey,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    "2",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: AppColors.darkGrey,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    "2",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  final bool detail;

  const _ImageBox({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      height: detail ? 200 : 120,
    );
  }
}
