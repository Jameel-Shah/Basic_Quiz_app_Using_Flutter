import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';


//Creating a "Stateful" widget that will help us change this screen and helps us route to another screen like "home"
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String loadingText; //Variable to hold loading text
  @override
  void initState() {
    //TODO: implement iniState
    super.initState();
    loadingText = 'Loading'; //Initialize with the text

    //Add a timer to update the text
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        //Now applying conditions to cycle through different loading text states
        if (loadingText == 'Loading') {
          loadingText = 'Loading.';
        } else if (loadingText == 'Loading.') {
          loadingText = 'Loading..';
        } else if (loadingText == 'Loading..') {
          loadingText = 'Loading...';
        } else {
          loadingText = 'Loading';
        }
      });
    });

    Timer(
      Duration(seconds: 8),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: darkBlue,
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              spacing: 10,
              //Center the contents using 'mainAxisAlignment'
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To!',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    //applying 'shadows' property to give shadows behind the text
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        color: Colors.black,
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                ),
                Text(
                  "'Quiz App BSCS-6th'",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: 'RobotoItalic',
                    fontWeight: FontWeight.bold,
                    //applying 'shadows' property to give shadows behind the text
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        color: Colors.black,
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                //Now adding a circular image using "CircularAvatar"
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('images/Quizicon.png'),
                ),
                const SizedBox(height: 20,),
                //Now show animated "Loading..." text
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                  duration: Duration(seconds: 1),
                  child: Text(loadingText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const Color darkBlue = Color(0xFF003366);
