import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Get screen height and width for responsive design
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Center content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Flexible(
                      flex: 3,
                      child: Image.asset(
                        'images/quizzler.png',
                        width: screenWidth * 0.4, // Scales proportionally
                        height: screenWidth * 0.4,
                      ),
                    ),

                    // Spacing
                    SizedBox(height: screenHeight * 0.02),

                    // Title with gradient text
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFF44336), // Red
                          Color(0xFFFFFFFF), // White
                        ],
                      ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                      child: Text(
                        'Quizzler',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'AnekLatin',
                          fontSize: screenWidth * 0.08, // Adaptive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Spacing
                    SizedBox(height: screenHeight * 0.05),

                    // Loading indicator
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        height: screenHeight * 0.07,
                        child: LoadingIndicator(
                          indicatorType: Indicator.semiCircleSpin,
                          colors: [
                            Color(0xFFF44336), // Red
                            Color(0xFFFFFFFF), // White
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
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
          ),
        ),
      ),
    );
  }
}
