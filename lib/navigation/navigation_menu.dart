import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sol_pinger_utility/Presentation/Pages/HomePage.dart';
import '../core/AppGlobals.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      const Homepage(),
      // const OrdersScreen(),
      // CartDetailsScreen(shopMore: onTap),
      // //const AccountScreen(),
      // const MapSample(),
      // const FifoAIScreen(),
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
          icon: Icon(Icons.ad_units_rounded,
              color: _selectedIndex == 1
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.my_orders),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart,
              color: _selectedIndex == 2
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.cart),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,
              color: _selectedIndex == 3
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.account),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded,
              color: _selectedIndex == 4
                  ? AppColors.turquoise
                  : AppColors.grey_600),
          label: AppLocalizations.of(context)?.fifo_ai)
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
