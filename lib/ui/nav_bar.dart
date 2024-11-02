import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<PersistentTabConfig> _tabs() => [
    // PersistentTabConfig(
    //   screen: const HomeView(),
    //   item: itemConfig(iconPath: "assets/icon/home.svg"),
    // ),
  ];

  // ItemConfig itemConfig({required String iconPath}) {
  //   return ItemConfig(
  //     icon: SvgPicture.asset(
  //       iconPath,
  //       color: Colors.black.withOpacity(0.8),
  //     ),
  //     inactiveIcon: SvgPicture.asset(
  //       iconPath,
  //       color: Colors.black.withOpacity(0.6),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
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
