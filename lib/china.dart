import 'package:flutter/material.dart';
import 'package:foodproject/china1.dart';
import 'package:foodproject/china2.dart';
import 'package:foodproject/china3.dart';
import 'package:foodproject/china4.dart';
import 'package:foodproject/china5.dart';
import 'package:foodproject/china6.dart';
import 'package:foodproject/random2.dart';
import 'package:foodproject/map.dart';

class ChinaImagePage extends StatelessWidget {
  void navigateToMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cook.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '음식 메뉴 추천',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '\n\n우리 뭐 먹을까\n\n\n세명대 제천시',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 0),
            Container(
              height: 540,
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-1.0, -0.9),
                    child: InkWell(
                      onTap: () {
                        // '랜덤' 컨테이너를 눌렀을 때 새로운 창으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China1Page()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 102,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/china1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '양고기',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, -0.9),
                    child: InkWell(
                      onTap: () {
                        // '랜덤' 컨테이너를 눌렀을 때 새로운 창으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China2Page()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 102,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/china2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '양꼬치',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1.0, -0.9),
                    child: InkWell(
                      onTap: () {
                        // '랜덤' 컨테이너를 눌렀을 때 새로운 창으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China3Page()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 102,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/china3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '딤섬',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1.0, -0.3),
                    child: InkWell(
                      onTap: () {
                        // '랜덤' 컨테이너를 눌렀을 때 새로운 창으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China4Page()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 102,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/china4.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '탕수육',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, -0.3),
                    child: InkWell(
                      onTap: () {
                        // '랜덤' 컨테이너를 눌렀을 때 새로운 창으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China5Page()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 102,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/china5.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '짜장면',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1.0, -0.3),
                    child: InkWell(
                      onTap: () {
                        // '랜덤' 컨테이너를 눌렀을 때 새로운 창으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China6Page()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 102,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/china6.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '짬뽕',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            Container(
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // Button 1 tapped
                    },
                    child: Image.asset('assets/like.png'),
                  ),
                  InkWell(
                    onTap: () {
                      navigateToMap(context);
                    },
                    child: Image.asset('assets/map.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Random2()),
                      );
                    },
                    child: Image.asset('assets/random2.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                    child: Image.asset('assets/back.png'),
                  ),
                ],
              ),
            ), //여기까지가 밑에 버튼있는 컨테이너
          ],
        ),
      ),
    );
  }
}