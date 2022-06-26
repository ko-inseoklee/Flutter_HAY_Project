import 'package:flutter/material.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  _ProfileMainPageState createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  //TODO: 유저 정보가 있는 지 먼저 불러오기. => Provider 필요.
  bool _isSignIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSignIn = false;
  }

  @override
  Widget build(BuildContext context) {
    //TODO: signin 정보 있으면 User profile 리턴.
    return _isSignIn ? nonUser() : nonUser();
  }

  Widget nonUser() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9],
                colors: [Color(0xff07689F), Color(0xff71BACD)])),
        child: Column(
          children: [
            Container(
              height: 300,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, left: 24),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '아직 우리사이 회원이 아니신가요?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('더 친한 우리사이를 경험하세요!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 385,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text('회원가입'),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                width: 385,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFC93C),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text('로그인'))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
