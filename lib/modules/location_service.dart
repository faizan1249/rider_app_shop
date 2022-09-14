// import 'package:flutter/cupertino.dart';
// import 'package:geolocator/geolocator.dart';

// import '../singleton/singletonConstants.dart';

// class CurrentLocation with ChangeNotifier {
//   double currentLat = 0.0;
//   double currentLong = 0.0;
//   Position? _currentPosition;

//   set setCurrentLat(double newLat) {
//     newLat = currentLat;
//     notifyListeners();
//   }

//   double get getCurrentLat => currentLat;

//   set setCurrentLong(double newLong) {
//     newLong = currentLong;
//     notifyListeners();
//   }

//   double get getCurrentLong => currentLong;

//   Future<Position?> getCurrentLocation() async {
//     LocationPermission permission;
//     permission = await Geolocator.requestPermission();
//     _currentPosition = await Geolocator.getCurrentPosition(
//         forceAndroidLocationManager: true,
//         desiredAccuracy: LocationAccuracy.bestForNavigation);
//     setCurrentLat = _currentPosition!.latitude;
//     setCurrentLong = _currentPosition!.longitude;

//     // Singleton.Currentlat = currentLat.value = _currentPosition.latitude;
//     // Singleton.CurrentLong = currentLong.value = _currentPosition.longitude;
//     // currentLatLongPostion = LatLng(currentLat, currentLong);
//     print(getCurrentLat);
//     print(getCurrentLong);
//     return _currentPosition;
//   }
// }
