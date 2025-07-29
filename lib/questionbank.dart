// Now by importing 'questions.dart' we can use the class in this file
import 'questions.dart';

//Now I will create a new class
class QuestionBank {
  //Initializing the 'count' variable as an index to keep track of the current question
  int count = 0;
  //Now, I will create a list to store questions
  List<QuestionAnswer> qesAnsBank = [
    //In this list, we will store questions and their answers by call the 'QuestionAnswer' constructor
    //First question
    QuestionAnswer(
      'Q1:Flutter is a cross-platform framework developed by Google.',
      true,
    ),
    //Second question
    QuestionAnswer('Q2:Flutter uses the Dart programming language.', true),
    //Third question
    QuestionAnswer(
      'Q3:Flutter apps are compiled to native code for better performance.',
      true,
    ),
    //Fourth question
    QuestionAnswer(
      'Q4:Flutter has a built-in widget library for building user interfaces.',
      true,
    ),
    //Fifth question
    QuestionAnswer(
      'Q5:Flutter supports hot reload, allowing developers to see changes in real-time.',
      true,
    ),
    //Sixth question
    QuestionAnswer('Q6:Flutter is only suitable for building mobile apps.', false),
    //Seventh question
    QuestionAnswer(
      'Q7:Flutter has a large and active community of developers.',
      true,
    ),
    //Eighth question
    QuestionAnswer(
      'Q8:Flutter apps can be deployed to both iOS and Android platforms.',
      true,
    ),
    //Ninth question
    QuestionAnswer(
      'Q9:Flutter provides a set of pre-built widgets for Material Design and Cupertino design.',
      true,
    ),
    //Tenth question
    QuestionAnswer('Q10:Flutter is an open-source framework.', true),
    //Eleventh question
    QuestionAnswer('Q11:Flutter uses a reactive programming model.', true),
    //Twelfth question
    QuestionAnswer(
      'Q12:Flutter has built-in support for gestures and animations.',
      true,
    ),
    //Thirteenth question
    QuestionAnswer(
      'Q13:Flutter apps can access native platform features like camera and GPS.',
      true,
    ),
    //Fourteenth question
    QuestionAnswer('Q14:Flutter has a complex and steep learning curve.', false),
    //Fifteenth question
    QuestionAnswer(
      'Q15:Flutter provides a rich set of APIs for networking and storage.',
      true,
    ),
    //Sixteenth question
    QuestionAnswer('Q16:Flutter supports web development.', true),
    //Seventeenth question
    QuestionAnswer(
      'Q17:Flutter has built-in support for internationalization and localization.',
      true,
    ),
    //Eighteenth question
    QuestionAnswer(
      'Q18:Flutter apps can be tested using the Flutter Test framework.',
      true,
    ),
    //Nineteenth question
    QuestionAnswer(
      'Q19:Flutter provides a set of tools for debugging and profiling apps.',
      true,
    ),
    //Twentieth question
    QuestionAnswer(
      'Q20:Flutter is widely adopted in the industry for building complex and scalable apps.',
      true,
    ),
  ];
  //Creating a function to store the current question from the "qesAnsBank" list
  String? GetQuestion() {
    return qesAnsBank[count].questionStatement;
  }

  //Similarly for answers, it will store only original answers
  bool? GetAnswer() {
    return qesAnsBank[count].answerStatement;
  }
  //Now, I will create a new method to increment to next index
void nextQuestion(){
    //Now, we will check that the count does not overflow the length of the list
    if(count<qesAnsBank.length-1){
      count++;
    }
}
//Now a function to end-quiz, to check whether the quiz is completed or not
 bool finishQuiz(){
    //Now,we will check if the 'count' is greater than or equal to the last index, then it will stop the quiz
    if(count>=qesAnsBank.length-1){
      return true;
    }else{
      return false;
    }
 }

 //Now, we will create a method to reset the quiz
 void quizClose(){
    count=0;
 }

}

//Now, We will access this class on the 'home' page by importing it as a library
