import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                controller: nameController,
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
                controller: emailController,
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
                controller: mobileController,
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
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
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
