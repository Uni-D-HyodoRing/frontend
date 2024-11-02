import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/ui/home/home_screen.dart';
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
      item: itemConfig(iconPath: "assets/icon/home.svg"),
    ),
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: itemConfig(iconPath: "assets/icon/home.svg"),
    ),
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: itemConfig(iconPath: "assets/icon/home.svg"),
    ),
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: itemConfig(iconPath: "assets/icon/home.svg"),
    ),
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: itemConfig(iconPath: "assets/icon/home.svg"),
    ),
  ];

  ItemConfig itemConfig({required String iconPath}) {
    return ItemConfig(
      icon: SvgPicture.asset(
        iconPath,
        color: Colors.black,
      ),
      inactiveIcon: SvgPicture.asset(
        iconPath,
        color: const Color(0xff999999),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,
      tabs: _tabs(),
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
