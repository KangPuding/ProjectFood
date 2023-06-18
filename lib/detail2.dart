import 'package:flutter/material.dart';
import 'dart:math';

import 'package:foodproject/map.dart';

class Detail2Page extends StatefulWidget {
  @override
  _Detail2PageState createState() => _Detail2PageState();
}

class _Detail2PageState extends State<Detail2Page> {
  List<String> texts = [
    "제육볶음", "비빔밥", "김밥", "해물파전", "비빔냉면", "잡채",
    "삼겹살", "오리 바베큐", "닭갈비", "갈비", "막창", "스테이크",
    "파스타", "리조또", "새우 필라프", "베이컨 필라프", "마늘빵", "가라아게",
    "양고기", "양꼬치", "딤섬", "탕수육", "짜장면", "짬뽕",
    "초밥", "라멘", "돈까스", "우동", "규동", "연어 롤",
    "어묵탕", "김치찌개", "닭도리탕", "나가사끼 짬뽕", "통오징어 짬뽕", "새우탕",
    "아메리카노", "카페 라떼", "초코케이크", "치즈케이크", "시나몬케이크", "블루베리케이크",
    "햄버거", "피자", "샌드위치", "치킨너겟", "KFC", "맥도날드",
    "떡볶이", "치즈볼", "만두튀김", "모듬튀김", "닭강정", "닭꼬치",
    "BBQ치킨", "네네치킨", "푸라닭", "맛닭꼬", "굽네치킨", "BHC치킨",
    "계란 샐러드", "과일 샐러드", "닭가슴살 샐러드", "월남쌈 샐러드", "아보카도 샐러드", "새우 샐러드"
    // 추가적인 음식 종류를 원하는 만큼 추가할 수 있습니다.
  ];

  List<String> images = [
    'assets/hansik1.png', 'assets/hansik.png', 'assets/hansik3.png', 'assets/hansik4.png', 'assets/hansik5.png', 'assets/hansik6.png',
    'assets/meat1.png', 'assets/meat2.png', 'assets/meat3.png', 'assets/meat4.png', 'assets/meat5.png', 'assets/meat6.png',
    'assets/form1.png', 'assets/form2.png', 'assets/form3.png', 'assets/form4.png', 'assets/form5.png', 'assets/form6.png',
    'assets/china1.png', 'assets/china2.png', 'assets/china3.png', 'assets/china4.png', 'assets/china5.png', 'assets/china6.png',
    'assets/japan1.png', 'assets/japan2.png', 'assets/japan3.png', 'assets/japan4.png', 'assets/japan5.png', 'assets/japan6.png',
    'assets/soup1.png', 'assets/soup2.png', 'assets/soup3.png', 'assets/soup4.png', 'assets/soup5.png', 'assets/soup6.png',
    'assets/coffee1.png', 'assets/coffee2.png', 'assets/coffee3.png', 'assets/coffee4.png', 'assets/coffee5.png', 'assets/coffee6.png',
    'assets/fastfood1.png', 'assets/fastfood2.png', 'assets/fastfood3.png', 'assets/fastfood4.png', 'assets/fastfood5.png', 'assets/fastfood6.png',
    'assets/snackbar1.png', 'assets/snackbar2.png', 'assets/snackbar3.png', 'assets/snackbar4.png', 'assets/snackbar5.png', 'assets/snackbar6.png',
    'assets/chicken1.png', 'assets/chicken2.png', 'assets/chicken3.png', 'assets/chicken4.png', 'assets/chicken5.png','assets/chicken6.png',
    'assets/salad1.png', 'assets/salad2.png', 'assets/salad3.png', 'assets/salad4.png', 'assets/salad5.png', 'assets/salad6.png'
    // 추가적인 이미지 경로를 원하는 만큼 추가할 수 있습니다.
  ];

  Random random = Random();
  int selectedIndex = 0;
  bool hideResult = false;

  @override
  void initState() {
    super.initState();
    selectedIndex = random.nextInt(texts.length);
  }

  void changeSelection() {
    int newIndex;
    do {
      newIndex = random.nextInt(texts.length);
    } while (newIndex == selectedIndex); // 이전 선택과 다른 인덱스 선택

    setState(() {
      selectedIndex = newIndex;
      hideResult = false; // 결과 표시
    });
  }

  void navigateToMap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('랜덤 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 233,
              height: 223,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(images[selectedIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 122,
              height: 68,
              child: Text(
                hideResult ? '' : texts[selectedIndex],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: navigateToMap,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/like.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('좋아요'),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.black),
                    backgroundColor: Colors.yellow,
                  ),
                ),
                OutlinedButton(
                  onPressed: changeSelection,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/hate.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('싫어요'),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.black),
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}