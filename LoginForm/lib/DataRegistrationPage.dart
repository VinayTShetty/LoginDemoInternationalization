import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class DataRegistrationPage extends StatelessWidget {
  String name, email, address, mobilenumber, place;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    print("DataRegistrationPage "+name);
    print("DataRegistrationPage "+email);
    print("DataRegistrationPage "+address);
    print("DataRegistrationPage "+mobilenumber);
    print("DataRegistrationPage "+place);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Page'),
        ),
        body:
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            )
    );

  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  DataRegistrationPage(
      {required this.name,
      required this.email,
      required this.address,
      required this.mobilenumber,
      required this.place});
}
