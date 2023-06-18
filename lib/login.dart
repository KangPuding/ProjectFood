import 'package:flutter/material.dart';
import 'register.dart';
import 'secondscreen.dart';
import 'splashscreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // 회원가입 버튼 클릭 시 실행될 함수
  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: deviceWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 112.06),
                Text(
                  "환영합니다!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff1ac073),
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 30.88),
                Text(
                  "자동화된 음식 추천 어플리케이션!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff1ac073),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30.88),
                Container(
                  width: deviceWidth * 0.87,
                  height: 73.70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xfff0faf7),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(
                      color: Color(0xff1ac073),
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "이메일",
                      hintStyle: TextStyle(
                        color: Color(0xff1ac073).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.88),
                Container(
                  width: deviceWidth * 0.87,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xfff0faf7),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(
                      color: Color(0xff1ac073),
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "패스워드",
                      hintStyle: TextStyle(
                        color: Color(0xff1ac073).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                GestureDetector(
                  onTap: () {
                    // 비밀번호를 잊어버리셨나요? 클릭 이벤트 처리
                  },
                  child: Text(
                    "비밀번호를 잊어버리셨나요?",
                    style: TextStyle(
                      color: Color(0xff1ac073),
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: deviceWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: navigateToSignUp,
                        child: Text(
                          "회원가입",
                          style: TextStyle(
                            color: Color(0xff1ac073),
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/kakao.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.88),
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
                    // 로그인없이 계속하기 클릭 이벤트 처리
                  },
                  child: Text(
                    "로그인없이 계속하기",
                    style: TextStyle(
                      color: Color(0xff1ac073),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 30.88),
                GestureDetector(
                  onTap: () {
                    // 로그인 버튼 클릭 이벤트 처리
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // TODO: 로그인 로직 구현

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
                    width: deviceWidth * 0.85,
                    height: 55,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
