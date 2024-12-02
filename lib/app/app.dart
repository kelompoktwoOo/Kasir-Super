import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:kelompoktwoo/config/config.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'package:kelompoktwoo/pages/home/home.dart';
import 'package:kelompoktwoo/pages/pos/pos.dart';
import 'package:kelompoktwoo/pages/product/product.dart';
import 'package:kelompoktwoo/pages/settings/settings.dart';
import 'package:kelompoktwoo/pages/transaction/transaction.dart';
import 'package:kelompoktwoo/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      FlutterUxcam.optIntoSchematicRecordings();
      FlutterUxConfig config = FlutterUxConfig(userAppKey: AppConfig.uxCamKey);
      FlutterUxcam.startWithConfiguration(config);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(
          create: (context) => ProfileBloc()..add(GetProfileEvent()),
        ),
        BlocProvider(
          create: (context) => XenditBloc()..add(GetXenditEvent()),
        ),
        BlocProvider(
          create: (context) => StruckBloc()..add(GetStruckEvent()),
        ),
        BlocProvider(create: (context) => PrinterBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => FormProductBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => TransactionBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        title: AppConfig.appName,
        debugShowCheckedModeBanner: false,
        theme: LightTheme(AppColors.green).theme,
        home: const SplashPage(),
        onGenerateRoute: routes,
      ),
    );
  }
}
