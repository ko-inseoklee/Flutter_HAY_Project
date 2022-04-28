import 'package:flutter/cupertino.dart';

class BalanceGame extends StatelessWidget {
  const BalanceGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
              children: [

              ],
            )
        ),
        Container(
          height: 150,
          padding: EdgeInsets.only(top: 16),
          child: Container(
            width: 130,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xffffc93c)
            ),
          ),
        ),
      ],
    );
  }
}
