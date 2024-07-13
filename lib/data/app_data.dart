import '../entities/trajet.dart';

class AppData {
  
  static List<Trajet> trajetsList = [
    Trajet(
      start: "Biyemassi",
      end: "Messassi",
      modelCar: "BMW",
      imageCarPath: 'assets/car1.png',
      time: 2,
      price: 10000,
    ),
    Trajet(
      start: "Rond-point",
      end: "Mendong",
      modelCar: "Hyundai",
      imageCarPath: 'assets/car2.png',
      time: 2,
      price: 6000,
    ),
    Trajet(
      start: "Tam-tam",
      end: "Emana",
      modelCar: "Mercedess",
      imageCarPath: 'assets/car3.png',
      time: 2,
      price: 8000,
    ),
    Trajet(
      start: "Essos",
      end: "Soa",
      modelCar: "Toyota",
      imageCarPath: 'assets/car4.png',
      time: 2,
      price: 12000,
    ),
  ];
}