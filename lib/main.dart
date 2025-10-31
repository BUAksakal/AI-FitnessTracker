import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wtracker/data/workout_data.dart';
import 'package:wtracker/pages/home_page.dart';
import 'package:wtracker/pages/recommendation_page.dart';
import 'package:wtracker/pages/settings_page.dart';
import 'package:wtracker/pages/splash_screen.dart';


void main() async {

  //initalize hive
  await Hive.initFlutter();

  //open a hive box
  await Hive.openBox("workout_database1");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> WorkoutData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

