import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loginform/DataRegistrationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //create the controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String dropdownValue = 'Bangalore';
  // late String name;
  // late String email;
  // late String mobile;
  // late String address;
  // late String place;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController place = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.registrationform),
      ),
      //for the form to be in center
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
               Text(AppLocalizations.of(context)!.name),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              //some space between name and email
              const SizedBox(
                height: 10,
              ),
               Text(AppLocalizations.of(context)!.email),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              //some space between email and mobile
              const SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.mobile),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: mobile,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.address),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                // Step 3.
                value: dropdownValue,
                // Step 4.
                items: <String>['Bangalore', 'Mysore']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              //create button for register
              ElevatedButton(
                onPressed: () {
                  //we will trying to print input
                  print(nameController.text);
                  print(emailController.text);
                  print(mobileController.text);
                  print(addressController.text);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MyApp1()),
                  // );
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DataRegistrationPage(name: "Vinay", email: "VinayTSherty@gmail.com", address: "Check123", mobilenumber: "4654", place: "Ban")));
                },
                child: Text(
                  AppLocalizations.of(context)!.register,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                 AppLocalizations.of(context)!.language,
                style: TextStyle(
                  fontSize: 30,
                ),
                 textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class MyApp1 extends StatefulWidget {

  String name,email,address,mobilenumber,place;


  MyApp1({required this.name,required this.email, required this.address,required this.mobilenumber, required this.place});

  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Data Page'),
          elevation: 2,
        ),
        body:Column(
          children: [
            Text(''),
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            )
          ],
        )

      );
  }
}
