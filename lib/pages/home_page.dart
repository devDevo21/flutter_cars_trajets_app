import 'package:cars_trajets/provider/cars_provider.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../screens/reservations_screen.dart';
import '../screens/search_screen.dart';
import '../screens/setting_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<Car>().pageIndex;
    Function setPageindex = context.read<Car>().setPageindex;
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
    Color textColor = context.watch<CustomTheme>().textColor;
    return Scaffold(
      backgroundColor: colorTheme,
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            SearchScreen(),
            ReservationsScreen(),
            SettingScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: currentIndex,
        unselectedItemColor: textColor,
        selectedItemColor: AppTheme.primaryColor,
        backgroundColor: colorTheme,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'Rechercher'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list_fill),
              label: 'Reservation'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_crop_circle,
              ),
              label: 'Réglages'),
        ],
        onTap: (value) {
          setPageindex(value);
        },
      ),
    );
  }
}
