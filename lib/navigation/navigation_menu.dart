import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sol_pinger_utility/presentation/pages/logs/logs_screen.dart';
import 'package:sol_pinger_utility/presentation/pages/settings/settings_screen.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../core/AppGlobals.dart';
import '../presentation/pages/add_url/add_url_screen.dart';
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
      const LogsScreen(),
      SettingsScreen(goBack: onTap),
    ];
  }

  void onTap(int index) {

    if(index == 0){
      WakelockPlus.enable();
    } else {
      WakelockPlus.disable();
    }

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
                  ? AppColors.secondaryMid
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.home),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_link,
              color: _selectedIndex == 1
                  ? AppColors.secondaryMid
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.add_url),
      BottomNavigationBarItem(
          icon: Icon(Icons.type_specimen,
              color: _selectedIndex == 2
                  ? AppColors.secondaryMid
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.logs),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings,
              color: _selectedIndex == 3
                  ? AppColors.secondaryMid
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.settings)
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
