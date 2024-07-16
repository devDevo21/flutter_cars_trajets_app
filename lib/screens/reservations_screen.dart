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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.medium(
          automaticallyImplyLeading: false,
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
                  child: const ShowMessageForEmptyReservationList()),
              Visibility(
                  visible: reservationList.isNotEmpty,
                  child: ShowReservationsList(
                    reservationList: reservationList,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
