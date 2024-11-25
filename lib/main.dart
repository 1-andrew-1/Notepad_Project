import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/sizeconfig/sizeconig.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// initialize database when app starts.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Sizeconig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Untitled 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }

}