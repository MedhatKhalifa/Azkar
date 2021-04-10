import 'package:azkar/db/dbhelper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:azkar/pages/common/theappbar.dart';

import 'package:azkar/redux/state/app_state.dart';
import 'package:azkar/size_config.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;
  HomePage({this.onInit});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['أذكارالصباح', 'أذكار المساء', 'السبحه'];

  @override
  Widget build(BuildContext context) {
    return (StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            //backgroundColor: Colors.white,
            appBar: theappBar(context),
            //drawer: Thedrawer(),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    _header('أذكارى'),

                    _mygrid(categories),
                    //Text('${zekr.category}'),
                    //_maincategory(context),
                    Divider(),
                    //_header('Service'),
                    // _horizontalListView(
                    //     state.serviceProducts, 'service'),
                    //new SizedBox(height: h(1)),
                    //Divider(),
                  ],
                );
              },
            ),
          );
        }));
  }
}

Widget _mygrid(data) {
  return Container(
    height: h(90),
    child: GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: w(1),
          mainAxisSpacing: h(1),
          childAspectRatio: ((w(100) / 2)) / (h(100) / 4)),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            if (data[i] == "السبحه") {
              Navigator.pushNamed(context, '/sebha');
            } else {
              Navigator.pushNamed(context, '/zekr',
                  arguments: {'categoryy': data[i], 'index': 1000});
            }
          },
          child: Container(
              decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.blue, width: 5.0)),
              child: Center(
                  child: Text('${data[i]}',
                      style: TextStyle(fontFamily: 'myarabic')))),
        );
      },
    ),
  );
}

Widget _header(str) {
  return Container(
      child: Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Center(
        child: Text(str,
            style: new TextStyle(
                fontSize: 18.0,
                color: Colors.red,
                fontWeight: FontWeight.bold)),
      ),
    ),
  ));
}
