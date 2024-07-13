import 'package:cars_trajets/provider/theme_provider.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../entities/trajet.dart';
import '../pages/details_page.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key, required this.trajet});
  final Trajet trajet;
  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
    Color thirdColor = context.watch<CustomTheme>().thirdColor;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.directions_walk,
                          color: thirdColor,
                        ),
                        Text(
                          trajet.start,
                          style: AppTheme.textStyle(
                              fontSize: TextSize.sm, color: textColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Minicard(content: trajet.modelCar),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          ' - - - - - - - - - - ',
                          style: TextStyle(color: textColor),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fmd_good,
                          color: AppTheme.primaryColor,
                        ),
                        Text(trajet.end,
                            style: AppTheme.textStyle(
                                color: textColor, fontSize: TextSize.sm))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('${trajet.price}XOF',
                        style: AppTheme.textStyle(
                          color: textColor,
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
