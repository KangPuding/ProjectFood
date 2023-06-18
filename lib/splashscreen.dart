import 'package:flutter/material.dart';
import 'secondscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToSecondScreen();
  }

  navigateToSecondScreen() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 332,
                height: 64,
                child: Text(
                  "식사메뉴를 선정해줄게!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Lexend Peta",
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(
                width: 332,
                height: 64,
                child: Text(
                  "Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Lexend Peta",
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
