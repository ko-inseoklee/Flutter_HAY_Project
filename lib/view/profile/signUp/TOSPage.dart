import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hay_project/view/profile/signUp/ProgressIndicator.dart';

class TOSPage extends StatelessWidget {
  const TOSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 20,
                    alignment: Alignment.topLeft,
                    child: ButtonTheme(
                      padding: EdgeInsets.zero,
                      child: FlatButton(
                        onPressed: (){
                          Get.back();
                          },
                        child: Icon(Icons.arrow_back_ios,size: 16,),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right:20),
                    child: ProgressIndicatorComponent(idx: 0,),
                  ),
                  Container(
                  ),
                ],
              ),),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
