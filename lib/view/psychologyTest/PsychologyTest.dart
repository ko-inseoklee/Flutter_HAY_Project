import 'package:flutter/cupertino.dart';
import 'package:hay_project/view/psychologyTest/PsychologyTestCard.dart';

class PsychologyTestPage extends StatelessWidget {
  PsychologyTestPage({Key? key}) : super(key: key);
  List<PsychologyTestCard> cards = [
    PsychologyTestCard(title: "MBTI", imagePath: "image/TestIcons/test1.png", url: "https://www.16personalities.com/ko/",),
    PsychologyTestCard(title: "애착유형", imagePath: "image/TestIcons/test2.png", url: "https://mgram.me/ko/",),
    PsychologyTestCard(title: "에고그램", imagePath: "image/TestIcons/test3.png", url: "http://ego.na.to/test/ego/",),
    PsychologyTestCard(title: "Mgram", imagePath: "image/TestIcons/test4.png", url: "http://typer.kr/test/ecr/",),
    PsychologyTestCard(title: "EQ 테스트", imagePath: "image/TestIcons/test5.png", url: "https://eqtest.kr/",),
    PsychologyTestCard(title: "결혼상대테스트", imagePath: "image/TestIcons/test6.png", url: "https://www.banggooso.com/gl/1002/",),
    PsychologyTestCard(title: "연락유형테스트", imagePath: "image/TestIcons/test7.png", url: "https://type-of-contact.netlify.app/",),
    PsychologyTestCard(title: "연애능력테스트", imagePath: "image/TestIcons/test8.png", url: "https://www.simcong.com/quiz/349",),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: cards,
        )
      ),
    );
  }
}
