import 'package:flutter/material.dart';
import 'detail2.dart';

class Random2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('랜덤'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail2Page()),
                );
              },
              child: Container(
                width: 383,
                height: 167,
                color: Color(0xffd9d9d9),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '랜덤으로 음식매칭\n\n랜덤으로 음식메뉴를 선정합니다',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/number1.png'), // 배경으로 사용할 이미지 경로
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


