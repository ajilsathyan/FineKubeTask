import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/images.dart';
import 'package:task/view/home/widgets/circular_widget.dart';
import 'package:task/view/home/widgets/custom_container.dart';

class FlexibleItemWidget extends StatelessWidget {
  const FlexibleItemWidget({Key? key}) : super(key: key);

  TextStyle style(Color color, double size) => TextStyle(
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: size,
      );

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      decoration: const BoxDecoration(gradient: gradient),
      child: Stack(
        children: [
          SizedBox(
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 10,
                          height: 140,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(22),
                                bottomRight: Radius.circular(22),
                              )),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomContainer(
                        color: green,
                        title1: "Owe Me",
                        title2: "\$ 1250",
                        title3: "2 debts",
                        icon: bottomLeftArrow,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomContainer(
                        color: orange,
                        title1: "I Owe",
                        title2: "\$ 1130",
                        title3: "2 debts",
                        icon: topArrow,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 10,
                          height: 140,
                          decoration: const BoxDecoration(
                              color: rightGreen,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22),
                                bottomLeft: Radius.circular(22),
                              )),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 120,
              width: w,
              decoration: const BoxDecoration(
                  color: pinkWhite,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
            ),
          ),
          Positioned(
              bottom: 48,
              child: SizedBox(
                height: 110,
                width: w,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: SizedBox(
                          width: w,
                          child: Row(
                            children: const [
                              Spacer(),
                              CircularWidget(
                                icon: yellowPlus,
                                title: "NEW",
                              ),
                              CircularWidget(
                                icon: yellowTopArrow,
                                title: "PAY OFF",
                              ),
                              CircularWidget(
                                icon: yellowLeftArrow,
                                title: "LEND",
                              ),
                              CircularWidget(
                                icon: grid,
                                title: "MORE",
                              ),
                              Spacer(),
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          Positioned(
              bottom: 20,
              child: SizedBox(
                width: w,
                height: 25,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "My Debts",
                      style: style(greyHalf, 20),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: style(fadeWhite, 16),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
