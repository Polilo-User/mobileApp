


import 'package:mobile_app_/repositories/rooms/models/room.dart';
import './sales_office.dart';

class ResidenceComplex {

  String description;
  List<Room> apartments;
  String deliveryDate;
  List<String> advantages;
  SalesOffice salesOffice;

  ResidenceComplex ({
    required this.description,
    required this.apartments,
    required this.deliveryDate,
    required this.advantages,
    required this.salesOffice,
  });

  Room cheapestApartment() {
    Room cheapest = apartments[0];
    for (var apartment in apartments) {
      if (apartment.price < cheapest.price) {
        cheapest = apartment;
      }
    }
    return cheapest;
  }

}
