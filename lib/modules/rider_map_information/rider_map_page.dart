// ignore_for_file: unnecessary_new, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_rider/modules/loader/full_screen_loader.dart';
import 'package:shopping_rider/modules/location_service.dart';
import 'package:shopping_rider/modules/rider_map_information/rider_map_controller.dart';
import 'package:shopping_rider/singleton/singletonConstants.dart';

class RiderPage extends GetView<RiderMapController> {
  var first;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.AppBarText.toString()),
        ),
        body: _buildBody(context),
        floatingActionButton: GetBuilder<RiderMapController>(
          builder: (controller) => FloatingActionButton(
            child: Icon(Icons.location_disabled_outlined),
            onPressed: () async {
              controller.putMarkerOnCurrentPosition();
            },
          ),
        ));
  }

  Widget _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: size.height * 0.6,
          child: GetBuilder<RiderMapController>(
            builder: (controller) => GoogleMap(
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: controller.kGooglePlex,
              compassEnabled: false,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              trafficEnabled: false,
              // polygons: controller.polygons,
              polylines: controller.polylines,
              markers: Set<Marker>.of(controller.markers),
              circles: controller.circles,
              onMapCreated: (GoogleMapController mapController) {
                controller.mapController.complete(mapController);
              },
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              try {} on Exception catch (e) {
                print(e.toString());
              }
            },
            child: Text(
              "Get Address",
              style: TextStyle(fontSize: 18),
            )),
        Container(
          child: Text(
            "Address:: " + Singleton.addressLine.toString(),
          ),
        ),
        Container(
          child: Text(
            "Latitude:: " + Singleton.Currentlat.toString(),
          ),
        ),
        Container(
          child: Text(
            "Longitude:: " + Singleton.CurrentLong.toString(),
          ),
        ),
        Container(
          child: GetBuilder<RiderMapController>(
            builder: (context) => Text(
              "Distance:: " + controller.abc.value.toString(),
            ),
          ),
          // child: Text(
          //   "Address:: " + controller.abc.value.toString(),
          // ),
        )
      ],
    );
  }
}
