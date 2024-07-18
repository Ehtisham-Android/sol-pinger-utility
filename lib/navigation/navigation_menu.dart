import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/AppGlobals.dart';
import '../presentation/Pages/add_url_screen.dart';
import '../presentation/pages/homepage/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final PageController _controller = PageController();
  int _selectedIndex = 0;
  late List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = [
      const HomeScreen(),
      AddUrlScreen(goBack: onTap),
    ];
  }

  void onTap(int index) {
    if (_selectedIndex != index) {
      _controller.jumpToPage(index);
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,
              color: _selectedIndex == 0
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.home),
      BottomNavigationBarItem(
          icon: Icon(Icons.link_outlined,
              color: _selectedIndex == 1
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: 'Urls'),
      BottomNavigationBarItem(
          icon: Icon(Icons.type_specimen,
              color: _selectedIndex == 2
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: 'Logs'),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings,
              color: _selectedIndex == 3
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: 'Settings')
    ];

    return Scaffold(
        body: PageView(
            controller: _controller, onPageChanged: onTap, children: list),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            items: bottomNavigationBarItems));
  }
}
