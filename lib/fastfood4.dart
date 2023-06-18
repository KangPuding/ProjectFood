import 'package:flutter/material.dart';
import 'package:foodproject/map.dart';

class Fastfood4Page extends StatelessWidget {

  void navigateToMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('선택'),
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
                  image: AssetImage('assets/fastfood4.png'),
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
                "치킨너겟",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    navigateToMap(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/like.png', width: 20, height: 20,),
                      SizedBox(width: 10,),
                      Text('좋아요'),
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
