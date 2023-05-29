import 'package:flutter/material.dart';
import 'package:foodproject/chicken.dart';
import 'package:foodproject/china.dart';
import 'dart:math';
import 'dart:async';

import 'package:foodproject/coffee.dart';
import 'package:foodproject/fastfood.dart';
import 'package:foodproject/form.dart';
import 'package:foodproject/hansik.dart';
import 'package:foodproject/japan.dart';
import 'package:foodproject/meat.dart';
import 'package:foodproject/salad.dart';
import 'package:foodproject/snackbar.dart';
import 'package:foodproject/soup.dart';

class Number1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '랜덤으로 음식매칭',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomImagePage(),
      routes: {
        '/chicken': (context) => ChickenImagePage(),
        '/china': (context) => ChinaImagePage(),
        '/coffee': (context) => CoffeeImagePage(),
        '/fastfood': (context) => FastfoodImagePage(),
        '/form': (context) => FormImagePage(),
        '/japan': (context) => JapanImagePage(),
        '/hansik': (context) => HansikImagePage(),
        '/meat': (context) => MeatImagePage(),
        '/salad': (context) => SaladImagePage(),
        '/snackbar': (context) => SnackbarImagePage(),
        '/soup': (context) => SoupImagePage(),
      },
    );
  }
}

class RandomImagePage extends StatefulWidget {
  @override
  _RandomImagePageState createState() => _RandomImagePageState();
}

class _RandomImagePageState extends State<RandomImagePage> {
  List<String> imageList = [
    'assets/chicken.png',
    'assets/china.png',
    'assets/coffee.png',
    'assets/fastfood.png',
    'assets/form.png',
    'assets/japan.png',
    'assets/korea.png',
    'assets/meat.png',
    'assets/salad.png',
    'assets/snackbar.png',
    'assets/soup.png',
  ];
  String selectedImage = '';
  String buttonText = '눌러주세요';
  Timer? timer;
  int currentIndex = 0;

  void changeImage() {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        selectedImage = imageList[currentIndex];
        currentIndex = (currentIndex + 1) % imageList.length;
      });
    });
    // Wait for some time and then stop the timer
    Future.delayed(Duration(seconds: 2), () {
      timer?.cancel();
      setState(() {
        buttonText = '눌러주세요';
      });
    });
  }

  void displayText() {
    setState(() {
      buttonText = '선택되었습니다!';
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('랜덤으로 음식매칭'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                changeImage();
                displayText();
              },
              child: Image.asset(
                'assets/Refresh.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              buttonText,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            if (selectedImage.isNotEmpty) ...[
              GestureDetector(
                onTap: () {
                  navigateToImagePage(context, selectedImage);
                },
                child: Image.asset(
                  selectedImage,
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                getMenuItemDescription(selectedImage),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String getMenuItemDescription(String image) {
    switch (image) {
      case 'assets/chicken.png':
        return '치킨';
      case 'assets/china.png':
        return '중식';
      case 'assets/coffee.png':
        return '커피';
      case 'assets/fastfood.png':
        return '패스트푸드';
      case 'assets/form.png':
        return '양식';
      case 'assets/japan.png':
        return '일식';
      case 'assets/korea.png':
        return '한식';
      case 'assets/meat.png':
        return '고기';
      case 'assets/salad.png':
        return '샐러드';
      case 'assets/snackbar.png':
        return '분식';
      case 'assets/soup.png':
        return '찌개';
      default:
        return '메뉴 설명이 없습니다.';
    }
  }

  void navigateToImagePage(BuildContext context, String selectedImage) {
    String routeName = '';
    switch (selectedImage) {
      case 'assets/chicken.png':
        routeName = '/chicken';
        break;
      case 'assets/china.png':
        routeName = '/china';
        break;
      case 'assets/coffee.png':
        routeName = '/coffee';
        break;
      case 'assets/fastfood.png':
        routeName = '/fastfood';
        break;
      case 'assets/form.png':
        routeName = '/form';
        break;
      case 'assets/japan.png':
        routeName = '/japan';
        break;
      case 'assets/korea.png':
        routeName = '/hansik';
        break;
      case 'assets/meat.png':
        routeName = '/meat';
        break;
      case 'assets/salad.png':
        routeName = '/salad';
        break;
      case 'assets/snackbar.png':
        routeName = '/snackbar';
        break;
      case 'assets/soup.png':
        routeName = '/soup';
        break;
    }
    if (routeName.isNotEmpty) {
      Navigator.pushNamed(context, routeName);
    }
  }
}