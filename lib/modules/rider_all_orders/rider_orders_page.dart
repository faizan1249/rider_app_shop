import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopping_rider/core/routings/app_routes.dart';
import 'package:shopping_rider/modules/rider_map_information/rider_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopping_rider/singleton/singletonConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RiderOrdersPage extends GetView<RiderMapController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("All Orders"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _ordersStream =
        firestore.collection("Orders").snapshots();
    print(_ordersStream);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        StreamBuilder(
          stream: _ordersStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Waiting");
            }
            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['CustomerName']),
                      subtitle: Text(data['email']),
                    );
                  })
                  .toList()
                  .cast(),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(routes.riderMap);
            },
            child: Text("Go to Map")),
      ],
    );

    // return ListView(
    //   shrinkWrap: true,
    //   children: [
    //     SizedBox(
    //       height: size.height * 0.05,
    //     ),
    //     AllOrdersWidget(),
    //   ],
    // );
  }
}

class AllOrdersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: false,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          title: Text("Faizan Ali"),
          subtitle: Text(Singleton.addressLine.toString()),
          leading: Icon(Icons.location_city_outlined),
        ),
        Divider(
          thickness: 5,
        ),
      ],
    );
  }
}
