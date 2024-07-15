import 'package:cars_trajets/provider/theme_provider.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../entities/trajet.dart';
import '../pages/details_page.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key, required this.trajet});
  final Trajet trajet;
  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    Color thirdColor = context.watch<CustomTheme>().thirdColor;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
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
                  child: SizedBox(
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' - - - - - ',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ],
      ),
    );
  }
}
