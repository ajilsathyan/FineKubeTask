import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';

class CircularWidget extends StatelessWidget {
  final String icon;
  final String title;
  const CircularWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 12, color: pinkWhite.withOpacity(0.7))),
          child: Container(
            width: 50,
            height: 50,
            decoration:
                const BoxDecoration(color: greyHalf, shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                icon,
                width: 16,
                height: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
