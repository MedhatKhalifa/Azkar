import 'package:azkar/pages/home/home_page.dart';

import 'package:azkar/pages/sebha/sebha.dart';
import 'package:azkar/pages/splash/splash_screen.dart';

import 'package:azkar/pages/zekr/zekr2.dart';
import 'package:azkar/theme.dart';
import 'package:flutter/material.dart';

import 'package:azkar/redux/reducers/reducers.dart';
import 'package:azkar/redux/state/app_state.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
//import 'package:device_preview/device_preview.dart';

//import 'package:device_preview/device_preview.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [thunkMiddleware, LoggingMiddleware.printer()]);
  runApp(MyApp(store: store));

  //  DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(store: store), // Wrap your app
  // ),
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          // locale: DevicePreview.locale(context), // Add the locale here
          // builder: DevicePreview.appBuilder, // Add the builder her
          title: 'Paw Point',
          routes: {
            '/': (BuildContext context) => SplashScreen(onInit: () {
                  //StoreProvider.of<AppState>(context).dispatch(getUserAction);
                }),
            //ForgotPasswordScreen(), //CompleteProfileScreen(), //
            '/home': (BuildContext context) => HomePage(),

            '/sebha': (BuildContext context) => Sebha(),
            '/zekr': (BuildContext context) => Zekr2(),
          },
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'myarabic'),
        ));
  }
}
