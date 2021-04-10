import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:azkar/redux/state/app_state.dart';

Widget theappBar(context) {
  return PreferredSize(
      // to increase appbar size
      preferredSize: Size.fromHeight(60.0),
      child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return AppBar(
              //leading: Icon(Icons.menu),
              centerTitle: true,

              title: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/logosvg.svg",
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                ],
              ),

              backgroundColor: Theme.of(context).primaryColor,
            );
          }));
}
