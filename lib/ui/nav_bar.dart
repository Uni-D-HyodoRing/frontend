import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/contents/contents_screen.dart';
import 'package:frontend/ui/history/history_screen.dart';
import 'package:frontend/ui/home/home_screen.dart';
import 'package:frontend/ui/profile/profile_screen.dart';
import 'package:frontend/ui/safety/safety_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: itemConfig(
            iconPath: "assets/icon/home.svg",
            title: "홈",
          ),
        ),
        PersistentTabConfig(
          screen: const ContentsScreen(),
          item: itemConfig(
            iconPath: "assets/icon/contents.svg",
            title: "컨텐츠",
          ),
        ),
        PersistentTabConfig(
            screen: const SafetyScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                "assets/icon/camera.svg",
              ),
              inactiveBackgroundColor: AppColors.primaryColor,
              title: "안부 보내기",
              activeForegroundColor: AppColors.primaryColor,
            )),
        PersistentTabConfig(
          screen: const HistoryScreen(),
          item: itemConfig(
            iconPath: "assets/icon/history.svg",
            title: "기록",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: itemConfig(
            iconPath: "assets/icon/profile.svg",
            title: "프로필",
          ),
        ),
      ];

  ItemConfig itemConfig({
    required String iconPath,
    required String title,
    Color? color,
  }) {
    return ItemConfig(
      title: title,
      activeForegroundColor: Colors.black,
      inactiveBackgroundColor: const Color(0xff999999),
      icon: SvgPicture.asset(
        iconPath,
        color: color == null ? Colors.black : Colors.white,
      ),
      inactiveIcon: SvgPicture.asset(
        iconPath,
        color: color == null ? const Color(0xff999999) : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,
      tabs: _tabs(),
      avoidBottomPadding: true,
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
