import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'secondscreen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool checkboxValue1 = false;
  bool checkboxValue2 = false;

  @override
  void dispose() {
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();

    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            width: 358.50,
            height: 700.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 241.33,
                  height: 69.70,
                  child: Text(
                    "회원가입",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff1ac073),
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 28.78),
                GestureDetector(
                  onTap: () {
                    nameFocusNode.requestFocus();
                  },
                  child: Material(
                    color: Color(0xfff0faf7),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 341.50,
                      height: 65.0,
                      padding: const EdgeInsets.only(right: 297, top: 7, bottom: 15),
                      child: SingleChildScrollView(
                        child: TextField(
                          focusNode: nameFocusNode,
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "이름",
                            hintStyle: TextStyle(
                              color: Color(0xff1ac073),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.78),
                GestureDetector(
                  onTap: () {
                    passwordFocusNode.requestFocus();
                  },
                  child: Material(
                    color: Color(0xfff0faf7),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 341.50,
                      height: 39.21,
                      padding: const EdgeInsets.only(left: 2, right: 266),
                      child: SingleChildScrollView(
                        child: TextField(
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "비밀번호",
                            hintStyle: TextStyle(
                              color: Color(0xff1ac073),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.78),
                GestureDetector(
                  onTap: () {
                    confirmPasswordFocusNode.requestFocus();
                  },
                  child: Material(
                    color: Color(0xfff0faf7),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 352.50,
                      height: 39.21,
                      padding: const EdgeInsets.only(left: 8),
                      child: SingleChildScrollView(
                        child: TextField(
                          focusNode: confirmPasswordFocusNode,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "비밀번호 재확인",
                            hintStyle: TextStyle(
                              color: Color(0xff1ac073),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.78),
                GestureDetector(
                  onTap: () {
                    emailFocusNode.requestFocus();
                  },
                  child: Material(
                    color: Color(0xfff0faf7),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 348.50,
                      height: 39.21,
                      padding: const EdgeInsets.only(left: 8),
                      child: SingleChildScrollView(
                        child: TextField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "이메일",
                            hintStyle: TextStyle(
                              color: Color(0xff1ac073),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.78),
                GestureDetector(
                  onTap: () {
                    phoneNumberFocusNode.requestFocus();
                  },
                  child: Material(
                    color: Color(0xfff0faf7),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 341.50,
                      height: 65.0,
                      padding: const EdgeInsets.only(left: 2, right: 213, top: 12, bottom: 10),
                      child: SingleChildScrollView(
                        child: TextField(
                          focusNode: phoneNumberFocusNode,
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "핸드폰 전화번호",
                            hintStyle: TextStyle(
                              color: Color(0xff1ac073),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.78),
                Row(
                  children: [
                    Checkbox(
                      value: checkboxValue1,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValue1 = value ?? false;
                        });
                      },
                    ),
                    Text(
                      "이용 수집 정보동의",
                      style: TextStyle(
                        color: Color(0xff1ac073),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checkboxValue2,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValue2 = value ?? false;
                        });
                      },
                    ),
                    Text(
                      "위치기반 서비스 동의",
                      style: TextStyle(
                        color: Color(0xff1ac073),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    });
                  },
                  child: Container(
                    width: 341.50,
                    height: 39.21,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 39.21,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x4c000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xff1ac073),
                            ),
                            padding: const EdgeInsets.only(left: 140, right: 151),
                            child: Center(
                              child: Text(
                                "로그인",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
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
      ),
    );
  }
}
