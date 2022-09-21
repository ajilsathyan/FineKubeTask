import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/images.dart';
import 'package:task/view/home/home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: w,
        height: 80,
        child: TabBar(
          controller: controller,
          padding: EdgeInsets.zero,
          isScrollable: false,
          indicatorColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          tabs: [
            CustomTabItem(
                controllerIndex: controller.index,
                icon: home,
                index: 0,
                name: 'Home'),
            CustomTabItem(
                controllerIndex: controller.index,
                icon: history,
                index: 1,
                name: 'History'),
            CustomTabItem(
                controllerIndex: controller.index,
                icon: article,
                index: 2,
                name: 'Articles'),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: yellow, borderRadius: BorderRadius.circular(27)),
                    child: Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          plus,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const HomeScreen(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}

class CustomTabItem extends StatelessWidget {
  int controllerIndex;
  int index;
  String icon;
  String name;

  CustomTabItem(
      {Key? key,
      required this.index,
      required this.icon,
      required this.name,
      required this.controllerIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: w * .09,
          height: 3,
          decoration: controllerIndex == index
              ? BoxDecoration(
                  color: greyHalf, borderRadius: BorderRadius.circular(5))
              : null,
        ),
        Spacer(),
        SizedBox(
          width: w * .06,
          height: w * .06,
          child: Image.asset(
            icon,
            color: controllerIndex == index ? greyHalf : fadeWhite,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: controllerIndex == index ? greyHalf : fadeWhite,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
