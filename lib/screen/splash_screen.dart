import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mp_ui/config/routes/app_routes.gr.dart';

import '../utils/app_asset.dart';
import '../utils/app_textstyle.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => AutoRouter.of(context).pushAndPopUntil(
              const HomeRoute(),
              predicate: (route) => false,
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AssetConstants.logo,
                width: 100,
                height: 100,
              ),
            ),
            Text(
              "Real Estaste App",
              style: AppStyle.customTextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
      )),
    );
  }
}
