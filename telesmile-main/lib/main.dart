// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:telesmile/src/view/audio/audio.dart';
import 'package:telesmile/src/view/widgets/navscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TeleSmile',
        theme: ThemeData(primaryColor: Colors.yellow),
        home: Splash()
        // AudioPage(audiolink: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
        );
  }
}

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // HttpService.getHomeSliderModel();
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => NavScreen()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage('assets/Group 21.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
