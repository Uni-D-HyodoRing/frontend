import 'package:flutter/material.dart';
import 'package:frontend/ui/common/components/posting_title_avatar.dart';

class PostingTitle extends StatelessWidget {
  final String name;
  final String date;
  final Widget? button;

  const PostingTitle({
    super.key,
    required this.name,
    required this.date,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PostingTitleAvatar(),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        if (button != null) button!,
      ],
    );
  }
}
