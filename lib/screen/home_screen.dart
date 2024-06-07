import 'package:animated_menu/animated_menu.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mp_ui/provider/home_provider.dart';
import 'package:mp_ui/screen/home/home_place_screen.dart';
import 'package:mp_ui/screen/search_map/search_map_view.dart';
import 'package:mp_ui/utils/app_asset.dart';
import 'package:mp_ui/utils/color.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider mProvider;
  List<String> navIcon = [
    AssetConstants.icSearch,
    AssetConstants.icSms,
    AssetConstants.icHome,
    AssetConstants.icHeart,
    AssetConstants.icUser
  ];
  bool _isInit = true;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      _isInit = false;
      mProvider = Provider.of<HomeProvider>(context);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, mProvider, child) {
      this.mProvider = mProvider;
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [ColorPallet.startColor, ColorPallet.endColor])),
          child: Stack(
            children: [
              customBottomNav(),
              Align(
                alignment: Alignment.bottomCenter,
                child: _navBar(),
              ),
            ],
          ),
        ),
      );
    });
  }

  _navBar() {
    return SlideInUp(
      delay: const Duration(milliseconds: 3000),
      child: Container(
        height: 56,
        width: 220,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
        decoration: const BoxDecoration(
          color: Color.fromARGB(192, 0, 0, 0),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: navIcon.map((item) {
            int index = navIcon.indexOf(item);
            bool isSelected = mProvider.selectedIndex == index;
            return GestureDetector(
              onTap: () {
                mProvider.setNavPosition(index);
              },
              child: Container(
                height: 35,
                width: 35,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: isSelected
                        ? ColorPallet.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: isSelected
                          ? ColorPallet.primaryColor
                          : const Color(0xff232220),
                      borderRadius: BorderRadius.circular(30)),
                  child: SizedBox(
                    child: Image.asset(
                      color: Colors.white,
                      item,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  customBottomNav() {
    if (mProvider.selectedIndex == 0) {
      return const SearchMapLocationScreen();
    } else if (mProvider.selectedIndex == 1) {
      return Container();
    } else if (mProvider.selectedIndex == 2) {
      return const HomePlaceScreen();
    } else if (mProvider.selectedIndex == 3) {
      return Container();
    } else if (mProvider.selectedIndex == 4) {
      return Container();
    } else {
      return Container();
    }
  }
}


/*
Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: ColorPallet.primaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: false ? ColorPallet.primaryColor : Color(0xff232220),
                  borderRadius: BorderRadius.circular(30)),
              child: SizedBox(
                child: Image.asset(
                  color: Colors.white,
                  AssetConstants.icSearch,
                ),
              ),
            ),
          ),
*/