import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/common/components/posting_card.dart';
import 'package:frontend/ui/common/components/posting_comment.dart';
import 'package:frontend/ui/common/components/posting_text_field.dart';
import 'package:frontend/ui/common/components/posting_title_avatar.dart';

class PostingDetailScreen extends StatelessWidget {
  const PostingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              PostingCard(
                name: "엄마",
                date: "2024.11.02",
                content: "따뜻했던 토요일의 기록",
                detail: true,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                //margin: EdgeInsets.only(bottom: 16.0),
                // decoration: postingBoxDecoration,
                child: Row(
                  children: [
                    const PostingTitleAvatar(),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: PostingTextField(
                        onChanged: (value) {},
                        hintText: "댓글을 입력하세요",
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              PostingComment(
                name: "김만두",
                date: "2024.11.02",
                comment: "나도 데러가 음마",
              ),
              PostingComment(
                name: "엄마",
                date: "2024.11.02",
                comment: "그려",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      // title: const Text("Back"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
