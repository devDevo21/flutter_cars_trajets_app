import '../entities/trajet.dart';

class AppData {
  
  static List<Trajet> trajetsList = [
    Trajet(
      start: "Biyemassi",
      end: "Messassi",
      modelCar: "BMW",
      imageCarPath: 'assets/car1.png',
      time: 2,
      price: 7000,
    ),
    Trajet(
      start: "Ngousso",
      end: "Mendong",
      modelCar: "Hyundai",
      imageCarPath: 'assets/car2.png',
      time: 2,
      price: 5000,
    ),
    Trajet(
      start: "Jouvence",
      end: "Nkoabang",
      modelCar: "Lexus",
      imageCarPath: 'assets/car3.png',
      time: 2,
      price: 7500,
    ),
    Trajet(
      start: "Essos",
      end: "Soa",
      modelCar: "Toyota",
      imageCarPath: 'assets/car4.png',
      time: 2,
      price: 9000,
    ),
  ];
}