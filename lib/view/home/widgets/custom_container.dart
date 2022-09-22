import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Color color;
  String title1;
  String title2;
  String title3;
  String icon;
  CustomContainer({
    Key? key,
    required this.color,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.icon,
  }) : super(key: key);

  TextStyle fadeStyle = const TextStyle(
      fontSize: 13, color: Colors.white54, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  title1,
                  style: fadeStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(title2,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 7,
                ),
                Text(title3, style: fadeStyle),
              ],
            ),
            Positioned(
                right: 10,
                top: 10,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    icon,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
