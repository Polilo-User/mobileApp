



import 'package:mobile_app_/modules/start_screen/start_screen.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/resident_complex_and_rooms_filter.dart';
import 'package:mobile_app_/modules/residence_complex_screen/view/residence_complex_screen.dart';
import 'package:mobile_app_/modules/rooms_list/view/rooms_list.dart';
import 'package:mobile_app_/modules/room_screen/view/room_screen.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/view/lead_time.dart';
import 'package:mobile_app_/modules/room_list_from_residence_complex/view/room_list_from_residence_complex.dart';

final routes = {
  '/': (context) => const MainPageScreen(),
  '/rest-commun-filter': (context) => const RestCommunFilter(),
  '/residence-complex-screen': (context) => const ResidenceComplexScreen(),
  '/rooms-list': (context) =>  const RoomsList(),
  '/room-screen': (context) =>  const RoomScreen(),
  '/lead-time': (context) => const LeadTime(),
  '/room-list-from-residence-complex': (context) => const RoomListFromResidenceComplex(),
};


