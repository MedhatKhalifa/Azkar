import 'package:azkar/db/dbhelper.dart';
import 'package:azkar/models/tables.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

import 'package:flutter/material.dart';

import 'package:azkar/pages/common/theappbar.dart';

import 'package:azkar/redux/state/app_state.dart';
import 'package:azkar/size_config.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Zekr2 extends StatefulWidget {
  final void Function() onInit;
  Zekr2({this.onInit});
  @override
  _Zekr2State createState() => _Zekr2State();
}

class _Zekr2State extends State<Zekr2> {
  DbHelper helper;
  List<Azkar> _listofazkar = [];
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  bool selected = false;

  Widget _buttonG(index) {
    return BouncingWidget(
      duration: Duration(microseconds: 1),
      scaleFactor: 2,
      onPressed: () {
        setState(() {
          if (_listofazkar[index].totalCount > 0) {
            _listofazkar[index].totaltotal = _listofazkar[index].totalCount - 1;
          }
        });
      },
      child: Center(
        child: Container(
            color:
                _listofazkar[index].totalCount == 0 ? Colors.green : Colors.red,
            height: h(7),
            alignment: Alignment.center,
            child: Text('${_listofazkar[index].totalCount.toString()}')),
      ),
    );
  }

  Widget _verticalListView() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        //height: h(90),
        child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _listofazkar.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text('${_listofazkar[index].pre}'),
                      Text(
                        '${_listofazkar[index].content}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text('${_listofazkar[index].after}'),
                      Text('${_listofazkar[index].fadl}'),
                      _buttonG(index),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    return (StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: theappBar(context),
          backgroundColor: Colors.white,
          // appBar: theappBar(context),
          // drawer: Thedrawer(),
          body: FutureBuilder(
              future: helper.allCourses(arguments['categoryy']),
              builder: (context, AsyncSnapshot snapshot) {
                if (_listofazkar.length == 0) {
                  for (var _data in snapshot.data) {
                    Azkar zekr = Azkar.fromMap(_data);
                    _listofazkar.add(zekr);
                  }
                }
                return !(snapshot.hasData) ||
                        (_listofazkar.length == 0) ||
                        (_listofazkar == null)
                    ? Container(
                        child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).accentColor)),
                      ))
                    : _verticalListView();
              }),
        );
      },
    ));
  }
}
