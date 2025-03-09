import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler/quiz_brain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color appbarColor = Colors.white30;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          backgroundColor: appbarColor,
          title: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.01),
            child: Text(
              'Quizzler',
              style: TextStyle(
                fontFamily: 'AnekLatin',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.09, // Adaptive font size
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            child: Quizzler(
              onChangedColor: (Color newColor) {
                setState(() {
                  appbarColor = newColor;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  final Function(Color) onChangedColor;
  const Quizzler({super.key, required this.onChangedColor});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 1;

  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.questionAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  border: Border.all(color: Colors.white60),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Finished!',
                      style: TextStyle(
                        fontFamily: 'AnekLatin',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'You\'ve reached the end of the Quiz.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 5.0,
                      children: scoreKeeper,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white60),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            quizBrain.reset();
                            scoreKeeper = [];
                            questionNumber = 1;
                            widget.onChangedColor(Colors.white30);
                          });
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.white,
                            fontFamily: 'AnekLatin',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        questionNumber++;
        if (userPickedAnswer == correctAnswer) {
          widget.onChangedColor(Colors.green);
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: MediaQuery.of(context).size.width * 0.049,
            ),
          );
        } else {
          widget.onChangedColor(Colors.red);
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: MediaQuery.of(context).size.width * 0.049,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Center(
              child: Text(
                'Question # $questionNumber',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.07,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Container(
              padding: EdgeInsets.all(screenHeight * 0.011),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Center(
                child: Text(
                  quizBrain.questionText(),
                  style: TextStyle(
                    fontFamily: 'AnekLatin',
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: screenWidth * 0.08,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Divider(
          endIndent: screenWidth * 0.03,
          indent: screenWidth * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.009),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          ),
        ),
        Divider(
          endIndent: screenWidth * 0.03,
          indent: screenWidth * 0.03,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.08),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.07,
                  fontFamily: 'AnekLatin',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.08),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.07,
                  fontFamily: 'AnekLatin',
                ),
              ),
            ),
          ),
        ),

        Divider(
          endIndent: screenWidth * 0.03,
          indent: screenWidth * 0.03,
        ),
        // Footer
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.01),
          child: Text(
            'Developed by: Waleed Taj',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'AnekLatin',
              fontSize: screenWidth * 0.035, // Adaptive font size
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
