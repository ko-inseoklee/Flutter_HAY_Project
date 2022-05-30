import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hay_project/view/psychologyTest/PsychologyTestWebView.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PsychologyTestCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String url;
  const PsychologyTestCard({Key? key,required this.title,required this.imagePath,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Get.to(PsychologyTestWebView(url: url));
      },
      child: Container(
        width: 180,
        height: 214,
        margin: EdgeInsets.only(left: 0,right: 0,top: 10,bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath)
            )
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),

          ),
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          width: 180,
          height: 44,
          child: Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600, color: Colors.white),),
        ),
      ),
    );
  }


}


