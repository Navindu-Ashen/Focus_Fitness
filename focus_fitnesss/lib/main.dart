import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/admin_home.dart';
import 'package:focus_fitnesss/Screens/check_auth.dart';
import 'package:focus_fitnesss/Screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:focus_fitnesss/Screens/Recipes/recipe_all.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      runApp(
        MyApp(),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 0, 0, 0),
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.uid == "hmp1M611rkaEXHTXY8YHJZn5nVw1") {
              // FirebaseAuth.instance.signOut();
              // print("Sign out .......................................");
              return const AdminMain();
            }
            return const CheckAuthScreen();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
