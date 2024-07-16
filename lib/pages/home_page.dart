import 'package:cars_trajets/provider/cars_provider.dart';
import 'package:cars_trajets/widgets/home_page_widgets.dart';
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
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
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
        bottomNavigationBar:
            BottomBarNavigationWidget(currrentIndex: currentIndex));
  }
}
