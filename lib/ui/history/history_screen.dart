import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/common/components/posting_card.dart';
import 'package:frontend/ui/history/posting_detail_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const _Title(),
          const _Filtering(),
          DecoratedSliver(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PostingDetailScreen(),
                        ),
                      ),
                      child: PostingCard(
                        name: "냐",
                        date: "냐하",
                        content: "냐하하",
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "안부 다시보기",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              "부모님과 주고받은 메시지를\n다시 읽어볼 수 있어요",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Filtering extends StatelessWidget {
  const _Filtering();

  @override
  Widget build(BuildContext context) {
    return DecoratedSliver(
      decoration: const BoxDecoration(color: Colors.white),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 4.0),
                  const Text(
                    "11월",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Text(
                  "날짜 선택",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
