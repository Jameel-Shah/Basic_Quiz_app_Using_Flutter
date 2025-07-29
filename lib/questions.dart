//Now I will create a class that will store questions and their answers

class QuestionAnswer{
  //Creating a variable that will store questions
  // '?' is for null safety, Which tells the compiler that the instances are null by default and have no null-value
  String? questionStatement;
  //Creating a variable that will store answers
  bool? answerStatement;
  //Now create the constructor of the class and pass parameters of both 'question and answer'
  //These parameters will be use used when this class's constructor will be called
  //'Q' parameter will store "string" value and 'A' parameter store will store "boolean" value
QuestionAnswer(String Q, bool A){
  questionStatement= Q;
  answerStatement = A;
}
}
//Now, We will access this class on the 'questionsbank.dart' file by importing it as a library