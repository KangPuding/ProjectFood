import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, bool> categoriesData = {
  '한식': true,
  '중식': true,
  '일식': true,
  '고기구이': true,
  '찌개': true,
  '커피 및 디저트': true,
  '패스트푸드': true,
  '분식': true,
  '치킨': true,
  '샐러드': true,
};

class ScissorPage extends StatefulWidget {
  @override
  _ScissorPageState createState() => _ScissorPageState();
}

class _ScissorPageState extends State<ScissorPage> {
  late Map<String, bool> categories;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadCategories();
  }

  Future<void> loadCategories() async {
    setState(() {
      categories = Map.from(categoriesData);
      categoriesData.forEach((key, value) {
        if (sharedPreferences.containsKey(key)) {
          categories[key] = sharedPreferences.getBool(key) ?? false;
        }
      });
    });
  }

  Future<void> saveCategory(String category, bool value) async {
    setState(() {
      categories[category] = value;
    });
    await sharedPreferences.setBool(category, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('취향으로 음식매칭'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: categories.keys.map((String category) {
          return CheckboxListTile(
            title: Text(category),
            value: categories[category],
            onChanged: (bool? value) {
              if (value != null) {
                saveCategory(category, value);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
