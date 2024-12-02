import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (!kIsWeb) {
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
    }

    PlatformDispatcher.instance.onError = (error, stack) {
      CrashlyticsHelper.capture(error, stack);
      return true;
    };

    Bloc.observer = AppBlocObserver();

    ConfigData.initialize();

    runApp(const MyApp());
  }, (exception, stackTrace) async {
    log('''
      EXCEPTION : $exception
      STACK : $stackTrace
    ''');
    CrashlyticsHelper.capture(exception, stackTrace);
  });
}
