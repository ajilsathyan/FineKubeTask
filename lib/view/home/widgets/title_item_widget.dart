import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/images.dart';

class TitleItemWidget extends StatelessWidget {
  const TitleItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.network(
                "https://cdn.icon-icons.com/icons2/1736/PNG/128/4043274-avatar-einstein-professor-scientist_113259.png"),
          ),
          const Spacer(),
          const Text(
            "Home",
            style: TextStyle(
                fontSize: 18, color: greyHalf, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(notification),
          )
        ],
      ),
    );
  }
}
