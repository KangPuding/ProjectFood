import 'package:flutter/material.dart';
import 'number1.dart';
import 'detail.dart';
import 'scissor.dart';


class RandomImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('음식 매칭 시스템'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // 첫 번째 네모난 컨테이너를 눌렀을 때 수행할 동작
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Number1Page(), // 첫 번째 네모난 컨테이너를 누르면 이동할 새로운 페이지
                    ),
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
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // 두 번째 네모난 컨테이너를 눌렀을 때 수행할 동작
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(), // 두 번째 네모난 컨테이너를 누르면 이동할 새로운 페이지
                    ),
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
                            '취향으로 음식매칭\n\n취향으로 음식메뉴를 선정합니다',
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
                            image: AssetImage('assets/love.png'), // 배경으로 사용할 이미지 경로
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // 세 번째 네모난 컨테이너를 눌렀을 때 수행할 동작
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScissorPage(), // 세 번째 네모난 컨테이너를 누르면 이동할 새로운 페이지
                    ),
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
                            '음식메뉴 편집\n\n선정되는 음식메뉴를 관리합니다',
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
                            image: AssetImage('assets/scissors.png'), // 배경으로 사용할 이미지 경로
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
      ),
    );
  }
}
