import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/home_screen.dart';
import 'package:flutter_apps/splash_screen.dart';


void main() => runApp(MyRootApp());

class MyRootApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}

// Future<void> main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final List<CameraDescription> camera = await availableCameras();
//   final CameraDescription firstCamera = camera.first;
//
//   runApp(MaterialApp(
//     title: 'jeje_id',
//     routes: <String, WidgetBuilder>{
//       '/': (BuildContext context) => Home(),
//       '/simulation': (BuildContext context) => SimulationScreen(),
//       '/profile' : (BuildContext context) => JejeCard(camera: firstCamera,),
//       '/chooseLocation': (BuildContext context) => ChooseLocation(),
//       '/loading': (BuildContext context) => Loading(),
//       '/login' : (BuildContext context) => LoginScreen(),
//       '/take_picture' : (BuildContext context) => TakeImage(camera: firstCamera),
//     },
//     // home: JejeCard(),
//   ));
// }

