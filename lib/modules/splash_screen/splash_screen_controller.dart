// ignore_for_file: unnecessary_new

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../../singleton/singletonConstants.dart';
import 'package:flutter_geocoder/geocoder.dart';

class SplashScreenController extends GetxController with StateMixin {
  late LatLng currentLatLongPostion;
  late Position _currentPosition;
  String? text = "Rider App";
  String? currentAddress;
  var address;

  Future<void> initPlatformState() async {}

  @override
  void onInit() async {
    print("OnInit Called");
    // TODO: implement onInit
    await getCurrentLocation();
    // await initPlatformState();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    // getCurrentLocation();
    super.onReady();
    print("OnReady Called");
  }

  Future getCurrentLocation({showLoading = true}) async {
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    // print(abc.toString());

    Singleton.Currentlat = _currentPosition.latitude;
    Singleton.CurrentLong = _currentPosition.longitude;
    // currentLatLongPostion = LatLng(currentLat, currentLong);
    print("Current Lat:: ");
    print(Singleton.Currentlat);
    print("Current Long:: ");
    print(Singleton.CurrentLong);
    final coordinates =
        new Coordinates(Singleton.Currentlat, Singleton.CurrentLong);

    address = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    print(address.first.addressLine);
    Singleton.addressLine = address.first.addressLine.toString();

    print(Singleton.addressLine);
  }

  Future<void> getAddessFromCoordinates() async {}
}
