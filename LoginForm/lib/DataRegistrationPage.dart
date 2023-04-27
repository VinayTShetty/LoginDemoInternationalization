import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
class DataRegistrationPage extends StatelessWidget {
  String name, email, address, mobilenumber, place;
   LatLng location =  LatLng(12.918427462285367, 77.50269032423634);
   late GoogleMapController mapController;
  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();
  @override
  Widget build(BuildContext context) {
    print("DataRegistrationPage "+name);
    print("DataRegistrationPage "+email);
    print("DataRegistrationPage "+address);
    print("DataRegistrationPage "+mobilenumber);
    print("DataRegistrationPage "+place);
    if(place=="Mumbai"){
      location=LatLng(19.123312171905123, 72.8541727615458);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Page'),
        ),
        body:
            GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.satellite,
              initialCameraPosition: CameraPosition(
                target:  location,
                zoom: 20,
              ),
                markers: {
                  Marker(
                    markerId: const MarkerId("marker2"),
                    position: location,
                      infoWindow: InfoWindow(
                        title: name,
                        snippet: email
                      )
                  ),
                },

              
            )
    );

  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.showMarkerInfoWindow(MarkerId("marker2"));
  }

  DataRegistrationPage(
      {required this.name,
      required this.email,
      required this.address,
      required this.mobilenumber,
      required this.place});
}
