import 'package:cars_trajets/entities/trajet.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cars_provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/reservations_screen._widgets.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Trajet> reservationList = context.watch<Car>().reservationList;
    Color textColor = context.watch<CustomTheme>().textColor;
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
    Color thirdColor = context.watch<CustomTheme>().thirdColor;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.medium(
          toolbarHeight: 100,
          backgroundColor: colorTheme,
          title: Text(
            'Mes Reservations',
            style: AppTheme.textStyle(
                fontWeight: FontWeight.bold,
                fontSize: TextSize.lg,
                color: textColor),
          ),
          centerTitle: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Visibility(
                  visible: reservationList.isEmpty,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      Icon(
                        Icons.error,
                        size: 45,
                        color: thirdColor,
                      ),
                      Text(
                        'Aucune Reservation',
                        style: AppTheme.textStyle(
                          fontSize: TextSize.lg,
                          color: textColor,
                        ),
                      ),
                      Text('Nous n\'avons trouvé aucune reservation',
                          style: AppTheme.textStyle(
                              fontSize: TextSize.sm, color: textColor))
                    ],
                  )),
              Visibility(
                  visible: reservationList.isNotEmpty,
                  child: Column(
                    children: [
                      ...reservationList.map((trajet) => Reservation(
                            trajet: trajet,
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}


// Padding(
//         padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
//         child: Column(
//           children: [
//             Text(
//               'Mes Reservations',
//               style: AppTheme.textStyle(
//                   fontWeight: FontWeight.bold, fontSize: TextSize.xl, color: textColor),
//             ),
//             ...reservationList.map((trajet) => Reservation(
//                   trajet: trajet,
//                 ))
//           ],
//         ),
//       ),
