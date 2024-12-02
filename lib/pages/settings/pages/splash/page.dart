import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kelompoktwoo/config/config.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'package:kelompoktwoo/pages/home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    if (kIsWeb) {
      Future.delayed(const Duration(seconds: 3)).then((v) {
        mainNavigate();
      });
    } else {
      mainNavigate();
    }
    super.initState();
  }


  void mainNavigate() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainPage.routeName,
      (route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MainAssets.logo, width: Dimens.dp100),
            Dimens.dp16.height,
            HeadingText(
              AppConfig.appName,
              style: TextStyle(color: context.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
