import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, bool> foodList = {
    '한식': false,
    '중식': false,
    '양식': false,
    '고기구이': false,
    '일식': false,
    '찌개': false,
    '커피 및 디저트': false,
    '패스트푸드': false,
    '분식': false,
    '치킨': false,
    '샐러드': false,
    // Add more food items here
  };

  @override
  Widget build(BuildContext context) {
    var checkedFoods = foodList.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('취향으로 음식매칭'),
      ),
      body: ListView(
        children: foodList.entries.map((entry) {
          return CheckboxListTile(
            title: Text(entry.key),
            value: entry.value,
            onChanged: (bool? value) {
              setState(() {
                foodList[entry.key] = value ?? false;
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (checkedFoods.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(checkedFoods: checkedFoods)),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('음식을 선택해주세요.')),
            );
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  final List<String> checkedFoods;

  ResultPage({Key? key, required this.checkedFoods}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? selectedFood;
  final random = Random();
  Timer? timer;
  int count = 0;
  int maxCount = 20; // 결과값이 멈추는 횟수
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (count < maxCount) {
          // 결과값 변경
          currentIndex = random.nextInt(widget.checkedFoods.length);
          selectedFood = widget.checkedFoods[currentIndex];
          count++;
        } else {
          // 타이머 멈춤
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void resetRandomFood() {
    setState(() {
      currentIndex = random.nextInt(widget.checkedFoods.length);
      selectedFood = widget.checkedFoods[currentIndex];
      count = 0;
      timer?.cancel();
      timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          if (count < maxCount) {
            currentIndex = random.nextInt(widget.checkedFoods.length);
            selectedFood = widget.checkedFoods[currentIndex];
            count++;
          } else {
            timer.cancel();
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('랜덤 선택 결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedFood ?? '',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: resetRandomFood,
              child: Text('다시 랜덤 선택'),
            ),
          ],
        ),
      ),
    );
  }
}
