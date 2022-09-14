// ignore_for_file: prefer_const_constructors, prefer_collection_literals, unnecessary_new
import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shopping_rider/singleton/singletonConstants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

class RiderMapController extends GetxController with StateMixin {
  late RxDouble currentLat = 0.0.obs;
  late RxDouble currentLong = 0.0.obs;
  late LatLng currentLatLongPostion;
  late Position _currentPosition;
  String? currentAddress;
  bool? isLoaded = false;
  String? AppBarText = "All Orders Through Map";
  // var address = ([]).obs;
  var address;
  Set<Polygon> polygons = HashSet<Polygon>();
  // this will hold the generated polylines
  final Set<Polyline> polylines = {};

// this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];

  PolylinePoints polylinePoints = PolylinePoints();

  String googleApiKey = "AIzaSyDewpahXI-I_OIiDCU7KQqsY2uDY-VfDOg";
  List<LatLng> LatLongPoints = [
    LatLng(Singleton.Currentlat, Singleton.CurrentLong),
  ].obs;
  RxDouble abc = 0.0.obs;

  @override
  void onInit() async {
    print("Values Initializing");
    getCurrentLocation();
    // print(address);
    // currentLat.value = Singleton.Currentlat;
    // currentLong.value = Singleton.CurrentLong;
    // print("Values Initialized");
    // markers.addAll(list);
    // await addMarkersToMap();
    // // print("LAst Latitude");
    // setPolylines();
    super.onInit();
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////
  LocationData? locationData;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      locationData = location;
    });
    GoogleMapController googleController = await mapController.future;
    location.onLocationChanged.listen((newLoc) {
      locationData = newLoc;

      print(locationData?.longitude);
      print(locationData?.latitude);
      Singleton.Currentlat = locationData!.latitude as double;
      Singleton.CurrentLong = locationData!.longitude as double;

      double distance = Geolocator.distanceBetween(
          Singleton.Currentlat, Singleton.CurrentLong, 31.417631, 73.119210);

      print("Distance: " + distance.toString());
      abc.value = distance;

      googleController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 25,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            ),
          ),
        ),
      );
      update();
    });
  }

  Completer<GoogleMapController> mapController = Completer();
  final CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(Singleton.Currentlat, Singleton.CurrentLong),
      zoom: 14.4746);

  Set<Circle> circles = Set.from([
    Circle(
        circleId: CircleId("1"),
        center: LatLng(31.4150846, 73.1288389),
        radius: 1000,
        strokeWidth: 2),
  ].obs);

  final markers = (List<Marker>.of([])).obs;

  Future<void> addMarkersToMap() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Orders").snapshots().listen((event) {
      final Longnames = [];
      final LatNames = [];
      final AddressList = [];
      for (int i = 0; i < event.docs.length; i++) {
        LatLongPoints.add(LatLng(
            event.docs[i].data()['coordinates']['latitude'],
            event.docs[i].data()['coordinates']['longitude']));

        print(event.docs[i].data()['coordinates']['latitude']);
        print(event.docs[i].data()['coordinates']['longitude']);
        markers.add(new Marker(
            markerId: MarkerId(event.docs[i].data()['email']),
            position: LatLng(
              event.docs[i].data()['coordinates']['latitude'],
              event.docs[i].data()['coordinates']['longitude'],
            ),
            infoWindow: InfoWindow(
                title: event.docs[i].data()['CustomerName'],
                snippet: "Hello")));
      }
      update();
      print(Longnames);
      print(LatNames);
    });
  }

  List<Marker> list = [
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(31.520370, 74.358749),
        infoWindow: InfoWindow(
          title: "This is Lahore",
        )),
  ].obs;

  void putMarkerOnCurrentPosition() async {
    print("Function Called");

    GoogleMapController googleController = await mapController.future;
    googleController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLat.value, currentLong.value),
      zoom: 14.10,
    )))
        .then((value) async {
      markers.add(Marker(
          markerId: MarkerId("5"),
          position: LatLng(Singleton.Currentlat, Singleton.CurrentLong),
          infoWindow: InfoWindow(
            title: Singleton.addressLine.toString(),
          )));
      update();
      print("Marker Added");
    });
    print("Adding Marker");
    try {} on Exception catch (E) {
      print(E.toString());
    }
  }

  void setPolylines() async {
    abc.value = Geolocator.distanceBetween(
        Singleton.Currentlat, Singleton.CurrentLong, 31.454413, 73.153765);

    print("Distance  + ${abc.toDouble()}");
    update();
    // PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
    //     googleApiKey,
    //     PointLatLng(Singleton.Currentlat, Singleton.CurrentLong),
    //     PointLatLng(31.4210388, 73.124558),
    //     travelMode: TravelMode.bicycling);
    // print(Singleton.Currentlat);
    // print(Singleton.CurrentLong);
    // print(result.points);
  }
}
