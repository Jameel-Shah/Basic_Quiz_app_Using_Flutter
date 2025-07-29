import 'package:flutter/material.dart';
import 'package:quiz_app/loading_screen.dart';
import 'package:quiz_app/result.dart';
//Now, I have imported the 'questionbank.dart' class library
import 'questionbank.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Now, we will create the 'QuestionBank' object
  QuestionBank qA = QuestionBank();
  int total= 0;
  //Now I will create a list that will contain the icons like 'check and close'
  int marks = 0;
  //Below list will store the icons
  List<Icon> iconSet = [];
  //Method for checking whether the quiz is finished and updates marks and displays the marks on the next screen
  void checkQuiz(bool userSelectedAnswer) {

    if (qA.finishQuiz()) {
      //Calling 'checking' method to check the selected question
      checking(userSelectedAnswer);
      total= iconSet.length*5;
      //Calling method to reset the quiz
      qA.quizClose();
      //Empty the list
      iconSet = [];
      //Now, We will pass the result and marks to the next screen like 'result'
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => Result(
                finalMarks: marks,
                totalMarks: total,
              ),
        ),
      );
    } //If the quiz is not completed then the below block will be executed
    else {
      //Calling 'checking' method to check the selected question
       checking(userSelectedAnswer);
      //Calling 'nextQuestion()' method to show the next question
      qA.nextQuestion();
    }
  }

  //Method to check the user's answer is correct or not
  // 'userSelectedAnswer' stores the user's selected answer
  void checking(bool userSelectedAnswer) {
    if (qA.GetAnswer() == userSelectedAnswer) {
      //if the user's answer is true then marks will be updated
      marks = marks + 5;
      //This icon will be displayed if the answer is correct
      iconSet.add(Icon(Icons.check, size: 50, color: Colors.green));
    } else {
      //This icon will be displayed if the answer is not correct
      iconSet.add(Icon(Icons.close, size: 50, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Creating a 'SafeArea' first
      home: SafeArea(
        child: Scaffold(
          //Now Creating an 'AppBar' with score text
          appBar: AppBar(
            backgroundColor: darkBlue,
            title: Center(
              child: Text(
                //Now access marks on the 'appBar'
                '$marks',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          //Now creating the front end inside the body
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                spacing: 10,
                //Center the content using 'mainAxisAlignment' property
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Creating a text widget that will contain the questions
                  Text(
                    // '!' is used to that the returned value will not be null and bypass null-safety. It will used to access questions directly
                    qA.GetQuestion()!,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //Now let's create two buttons with the text like 'True and False' by using "Elevated Button"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //I am styling this button to give it a hover effect along with shadow
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.lightGreenAccent,
                      //This property is used to give shadow behind the 'ElevatedButton'
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      //Passing the icons code into List then paste it 'setState' property of the 'onPressed' in Elevated Buttons
                      setState(() {
                        //Call 'checkQuiz' method
                        checkQuiz(true);
                      });
                    },
                    child: Text(
                      'TRUE',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //Similarly for 'False'
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //I am styling this button to give it a hover effect along with shadow
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.redAccent,
                      //This property is used to give shadow behind the 'ElevatedButton'
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      //Passing the icons code into List then paste it 'setState' property of the 'onPressed' in Elevated Buttons
                      setState(() {
                        //Similarly for 'false'
                        checkQuiz(false);
                      });
                    },
                    child: Text(
                      'FALSE',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //Now creating a row that will contain icons. Also wrap it with 'SingleChildScrollView' widget
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //Now access the list
                      children: iconSet,
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
