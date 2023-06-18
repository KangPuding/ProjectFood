import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120,
              height: 121,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                image: DecorationImage(
                  image: AssetImage('assets/apple.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 200),  // This is to adjust the space between the image and the text
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: SizedBox(
                width: 200,
                height: 83,
                child: Text(
                  "START!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Lexend Peta",
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

