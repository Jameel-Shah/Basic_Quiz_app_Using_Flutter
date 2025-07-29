import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/loading_screen.dart';

class Result extends StatefulWidget {
  final dynamic finalMarks;
  final dynamic totalMarks;



  const Result({
    super.key,
    //Initializing properties to pass the values from the previous 'home' screen to this screen
    required this.finalMarks,
    required this.totalMarks,
  });

  @override
  State<Result> createState() => _ResultState();
}
class _ResultState extends State<Result> {
  //Creating a method  that will return widget  based on the the value of 'percentage'
  //It returns the message that will be stored into the 'message' instance and also returns image that will be stored into the 'image' Instance
  Widget get resultWidget {
    //Initialize an instance which will store the percentage calculated from 'finalMarks and totalMarks'
    var percentage= (widget.finalMarks/widget.totalMarks)*100;
    String message;
    String imPath;
    if (percentage >= 90) {
      message = 'Great Score!';
      imPath = 'images/emojis/Star.png';
    } else if (percentage>=80) {
      message = 'Good Score!';
      imPath = 'images/emojis/Thumbs.png';
    } else if (percentage>=70) {
      message = 'Improve Your Score!';
      imPath = 'images/emojis/Neutral.png';
    } else if (percentage>= 50) {
      message = 'Do More Hardwork!';
      imPath = 'images/emojis/Sad.png';
    } else {
      message = 'Poor score!';
      imPath = 'images/emojis/Cry.png';
    }

    //Now return the tree which will contain the calculated marks and the message of 'You have corrected X answers out of Y questions'
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            message,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          //Now, We will access the 'imPath' parameter
          Image.asset(imPath, height: 100, fit: BoxFit.contain),
          //Now, we will display the message to show how may answers are correct out how many questions
          Text(
            'You Score is ${widget.finalMarks} out of ${widget.totalMarks} marks!',
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),Text(
            'Percentage: $percentage%',
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: darkBlue,
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  resultWidget,
                  Text(
                    //Now access marks on the 'appBar' by using 'widget' property
                    'Marks: ${widget.finalMarks}',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //Now a button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //I am styling this button to give it a hover effect along with shadow
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.grey,
                      //This property is used to give shadow behind the 'ElevatedButton'
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'RESET',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
            
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //I am styling this button to give it a hover effect along with shadow
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.deepOrange,
                      //This property is used to give shadow behind the 'ElevatedButton'
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      'EXIT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
