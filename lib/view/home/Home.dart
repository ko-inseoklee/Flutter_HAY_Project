import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/view/communication/Communication.dart';
import 'package:hay_project/view/psychologyTest/PsychologyTest.dart';
import 'package:hay_project/view/games/Game.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  List<String> name = ["대화","게임","심리테스트","마이페이지"];
  List<Widget> pages = [CommunicationPage(),GamePage(),PsychologyTestPage(),GamePage()];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name[_pageIndex],style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff07689F),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff40A8C4),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.9
            ],
            colors: [
              Color(0xff07689F),
              Color(0xff71BACD)
            ]
          )
        ),
        child: pages[_pageIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems(),
        currentIndex: _pageIndex,
        // fixedColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (int idx){
          print(idx);
          setState(() {
            _pageIndex = idx;
          });

        },
        backgroundColor: Color(0xff07689F),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems(){
    return [
      new BottomNavigationBarItem(
          icon: Image.asset("image/BNBIcons/CommunicationIcon.png",color: _pageIndex == 0? Colors.white : Colors.white.withOpacity(0.6)),
          label: "대화"
      ),
      new BottomNavigationBarItem(
          icon: Image.asset("image/BNBIcons/GameIcon.png",color: _pageIndex == 1? Colors.white : Colors.white.withOpacity(0.6)),
          label: "게임"
      ),
      new BottomNavigationBarItem(
          icon: Image.asset("image/BNBIcons/TestIcon.png",color: _pageIndex == 2? Colors.white : Colors.white.withOpacity(0.6)),
          label: "심리테스트",

      ),
      new BottomNavigationBarItem(
          icon: Image.asset("image/BNBIcons/ProfileIcon.png",color: _pageIndex == 3? Colors.white : Colors.white.withOpacity(0.6)),
          label: "마이페이지"
      ),
    ];
  }
}
