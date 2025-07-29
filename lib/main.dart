import 'package:flutter/material.dart';
import 'package:quiz_app/loading_screen.dart';



void main(){
  runApp(Loading());
}

//Creating a 'stateless' widget
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

