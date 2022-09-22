import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task/constants/colors.dart';
import 'package:task/models/debts_model.dart';
import 'package:task/services/api_services.dart';
import 'package:task/view/home/widgets/custom_tile.dart';
import 'package:task/view/home/widgets/flexible_item_widget.dart';
import 'package:task/view/home/widgets/title_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamController<List<Data>> streamController;

  List<Data> debtList = [];

  ScrollController scrollController = ScrollController();

  bool hide = false;

  @override
  void initState() {
    streamController = StreamController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!hide) {
          hide = true;
          setState(() {});
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (hide) {
          hide = false;
          setState(() {});
        }
      }
    });

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getDebtsData();
      }
    });

    getDebtsData();
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    scrollController.removeListener(() {});
    super.dispose();
  }

  getDebtsData() async {
    try {
      Response response = await ApiServices().getData(1);
      if (response.statusCode == 200) {
        DebtsModel model = DebtsModel.fromJson(response.data);
        debtList.addAll(model.data ?? []);
        streamController.sink.add(debtList);
      }
    } catch (e) {
      streamController.add([]);
    }
  }

  Future<void> getData() async {
    streamController.sink.add([]);
    debtList.clear();
    getDebtsData();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: RefreshIndicator(
          onRefresh: getData,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                floating: true,
                primary: true,
                pinned: true,
                expandedHeight: 370,
                collapsedHeight: 170,
                elevation: 0,
                flexibleSpace: const FlexibleItemWidget(),
                title: hide ? const SizedBox() : const TitleItemWidget(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: pinkWhite,
                  child: StreamBuilder<List<Data>>(
                    stream: streamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          color: pinkWhite,
                          width: w,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length + 1,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                                bottom: 20, top: 0, right: 0, left: 0),
                            itemBuilder: (context, index) {
                              if (index != snapshot.data!.length) {
                                Data value = snapshot.data![index];
                                return ScaleAnimation(
                                  child: CustomTile(
                                    data: value,
                                    i: index,
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  width: w,
                                  height: 80,
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      } else {
                        return  Center(
                            child:
                                SizedBox(
                                  height: 300,
                                  width: w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          width: 30,
                                          child:const CircularProgressIndicator()),
                                    ],
                                  ),
                                ));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
