import 'package:cars_trajets/entities/trajet.dart';
import 'package:cars_trajets/provider/cars_provider.dart';
import 'package:cars_trajets/provider/theme_provider.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/search_screen_widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Trajet> trajetsList = context.watch<Car>().trajetsList;
    Color textColor = context.watch<CustomTheme>().textColor;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: textColor,
        ),
        actions: [
          Icon(
            CupertinoIcons.person,
            color: textColor,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 10,
        centerTitle: true,
        title: Text('Trajets disponibles',
            style: TextStyle(color: textColor, fontSize: TextSize.lg)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              // const Hearder(),
              ...trajetsList.map((trajet) => TrajetsList(trajet: trajet)),
            ],
          ),
        ),
      ),
    );
  }
}
