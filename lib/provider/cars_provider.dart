import 'package:cars_trajets/data/app_data.dart';
import 'package:cars_trajets/entities/trajet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final carsProvider = ChangeNotifierProvider(
    create: (ref) => Car(
          trajetsList: AppData.trajetsList,
        ));

class Car extends ChangeNotifier {
  final List<Trajet> trajetsList;
  late List<Trajet> reservationList = [];
  int pageIndex = 0;

  Car({required this.trajetsList});

  void setPageindex(int newIndex) {
    pageIndex = newIndex;
    notifyListeners();
  }

  void confirmReservation(Trajet trajet) {
    reservationList.add(trajet);
    notifyListeners();
  }
}
