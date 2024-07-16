import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cars_provider.dart';
import '../provider/theme_provider.dart';
import '../theme/app_theme.dart';

class BottomBarNavigationWidget extends StatelessWidget {
  const BottomBarNavigationWidget({super.key, required this.currrentIndex});
  final int currrentIndex;
  @override
  Widget build(BuildContext context) {
    Function setPageindex = context.read<Car>().setPageindex;
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
    Color textColor = context.watch<CustomTheme>().textColor;
    return BottomNavigationBar(
      elevation: 10,
      currentIndex: currrentIndex,
      unselectedItemColor: textColor,
      selectedItemColor: AppTheme.primaryColor,
      backgroundColor: colorTheme,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), label: 'Rechercher'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list_fill), label: 'Reservation'),
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_crop_circle,
            ),
            label: 'Réglages'),
      ],
      onTap: (value) {
        setPageindex(value);
      },
    );
  }
}
