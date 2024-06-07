import 'dart:async';
import 'dart:ui';

import 'package:animated_menu/animated_menu.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mp_ui/screen/widget/show_up_text_animation.dart';
import 'package:mp_ui/utils/app_asset.dart';
import 'package:mp_ui/utils/app_textstyle.dart';
import 'package:mp_ui/utils/color.dart';

class HomePlaceScreen extends StatefulWidget {
  const HomePlaceScreen({super.key});

  @override
  State<HomePlaceScreen> createState() => _HomePlaceScreenState();
}

class _HomePlaceScreenState extends State<HomePlaceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  bool isAlignedRight = false;
  bool isSwipAnim = false;

  List<String> homeImages = [
    AssetConstants.ic1,
    AssetConstants.ic2,
    AssetConstants.ic3,
    AssetConstants.ic4,
    AssetConstants.ic5,
    AssetConstants.ic6,
    AssetConstants.ic7,
    AssetConstants.ic8,
    AssetConstants.ic9,
    AssetConstants.ic10,
  ];

  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () {
        isSwipAnim = true;
      },
    );
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        animationBehavior: AnimationBehavior.preserve);
    animation = IntTween(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    animation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      welcomeText(),
                      const SizedBox(
                        height: 20,
                      ),
                      buyAndRentBlock(),
                      const SizedBox(
                        height: 20,
                      ),
                      ShowUp(
                        delay: 2000,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: StaggeredGrid.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            children: [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 4,
                                mainAxisCellCount: 2,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(AssetConstants.ic1),
                                          fit: BoxFit.cover)),
                                  child: animatedSwipeBtn(),
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 3,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(AssetConstants.ic1),
                                          fit: BoxFit.cover)),
                                  child: animatedSwipeBtn(),
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 1.5,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(AssetConstants.ic1),
                                          fit: BoxFit.cover)),
                                  child: animatedSwipeBtn(),
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 1.5,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(AssetConstants.ic1),
                                          fit: BoxFit.cover)),
                                  child: animatedSwipeBtn(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  customAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlideInLeft(
            child: Container(
              height: 40,
              width: 150,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetConstants.icPin,
                    width: 15,
                    height: 15,
                    color: ColorPallet.textColor,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Saint Petersburg',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.customTextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: ColorPallet.textColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ZoomIn(
            duration: const Duration(milliseconds: 2500),
            child: SizedBox(
              height: 35,
              width: 35,
              child: Center(
                child: ClipOval(
                  child: SizedBox.fromSize(
                      size: const Size.fromRadius(35),
                      child: Image.asset(
                        AssetConstants.icAvtar,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  welcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowUp(
          delay: 300,
          child: Text(
            'Hi, Marina',
            style: AppStyle.customTextStyle(
                color: ColorPallet.textColor, fontSize: 20.0),
          ),
        ),
        ShowUp(
          delay: 500,
          child: Text(
            'let\'s select your ',
            style: AppStyle.customTextStyle(
                color: const Color(0xff232220),
                fontSize: 34.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        ShowUp(
          delay: 700,
          child: Text(
            'perfect place',
            style: AppStyle.customTextStyle(
                color: const Color(0xff232220),
                fontSize: 34.0,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  buyAndRentBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ZoomIn(
            delay: const Duration(milliseconds: 1200),
            onFinish: (direction) {
              setState(() {
                isAlignedRight = true;
                if (controller.value == 0.0) {
                  controller.forward();
                }
              });
            },
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: ColorPallet.primaryColor,
                ),
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BUY',
                      style: AppStyle.customTextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Countup(
                            begin: 0,
                            end: 1034,
                            duration: const Duration(milliseconds: 2000),
                            separator: ',',
                            maxLines: 1,
                            style: AppStyle.customTextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Colors.white),
                          ),
                          Text(
                            'offers',
                            style:
                                AppStyle.customTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ZoomIn(
            delay: const Duration(milliseconds: 1200),
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RENT',
                    style:
                        AppStyle.customTextStyle(color: ColorPallet.textColor),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Countup(
                          begin: 0,
                          end: 2212,
                          duration: const Duration(milliseconds: 2000),
                          separator: ',',
                          style: AppStyle.customTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                              color: ColorPallet.textColor),
                        ),
                        Text(
                          'offers',
                          style: AppStyle.customTextStyle(
                              color: ColorPallet.textColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  animatedSwipeBtn() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      width: isSwipAnim ? MediaQuery.of(context).size.width : 30,
      height: 40,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Stack(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Gladkova St,25',
                        maxLines: 1,
                        style: AppStyle.customTextStyle(fontSize: 10.0)),
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
    // return Row(
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Expanded(
    //       flex: 10,
    //       child: ClipRRect(
    //           borderRadius: const BorderRadius.all(Radius.circular(20)),
    //           child: BackdropFilter(
    //             filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
    //             child: Container(
    //               height: 40,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white.withOpacity(0.5),
    //               ),
    //               child: Stack(
    //                 children: [
    //                   Center(
    //                       child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Text('Gladkova St,25',
    //                         maxLines: 1,
    //                         style: AppStyle.customTextStyle(fontSize: 10.0)),
    //                   )),
    //                   Align(
    //                     alignment: Alignment.centerRight,
    //                     child: Container(
    //                       margin: const EdgeInsets.all(5),
    //                       height: 30,
    //                       width: 30,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(20),
    //                           color: Colors.white),
    //                       child: const Icon(
    //                         Icons.keyboard_arrow_right_rounded,
    //                         size: 15,
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           )),
    //     ),
    //     Expanded(
    //       flex: animation.value,
    //       // Uses to hide widget when flex is going to 0
    //       child: SizedBox(
    //         width: 0,
    //         child: Container(),
    //       ),
    //     )
    //   ],
    // );
  }
}
