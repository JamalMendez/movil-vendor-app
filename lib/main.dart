import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:multistore_vendor_app/vendor/views/auth/vendor_auth_screen.dart';
import 'package:multistore_vendor_app/vendor/views/vendor_screens/landing_screen.dart';
import 'package:multistore_vendor_app/vendor/views/vendor_screens/main_vendor_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBYsNxA7PIAsAcBajHIDRsUzTNyLuUR09k",
          appId: "1:298702164343:android:4f1c918b402cf727879172",
          messagingSenderId: "298702164343",
          projectId: "multi-sotore-app-v2",
          storageBucket: "gs://multi-sotore-app-v2.appspot.com"
      )
  ) : await Firebase.initializeApp();
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: VendorAuthScreen(),
    );
  }
}