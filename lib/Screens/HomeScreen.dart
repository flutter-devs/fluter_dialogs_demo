import 'dart:async';

import 'package:Aeologic/Models/MenuItemsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  BuildContext scaffoldContext;

  List<MenuItemModel> itemList = const <MenuItemModel>[
    const MenuItemModel(title: 'Settings', icon: Icons.settings),
    const MenuItemModel(title: 'Theme', icon: Icons.theaters),
    const MenuItemModel(title: 'FeedBack', icon: Icons.feedback),
  ];
  var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Material Dialogs Demo"),
          actions: <Widget>[
            PopupMenuButton<MenuItemModel>(
              onSelected: _selectedValue,
              itemBuilder: (BuildContext context) {
                return itemList.map((MenuItemModel item) {
                  return PopupMenuItem<MenuItemModel>(
                    value: item,
                    child: Row(
                      children: <Widget>[
                        Icon(item.icon),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.title),
                        )
                      ],
                    ),
                  );
                }).toList();
              },
            )
          ],
        ),
        body:ListView(
          shrinkWrap: true,
          children: <Widget>[
             Builder(builder: (BuildContext context) {
                  scaffoldContext = context;
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            child: RaisedButton(
                              onPressed: () async {
                                DateTime _todayDate = new DateTime.now();
                                DateTime _initialDate = new DateTime(1990);
                                DateTime _lastDate = new DateTime(2080);
                                final DateTime picked = await showDatePicker(

                                  context: context,
                                  initialDate: _todayDate,
                                  firstDate: _initialDate,
                                  lastDate: _lastDate,
                                );

                                if (picked.toString() != null) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      picked.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Color(0xFF000000),
                                  );

                                  Scaffold.of(scaffoldContext).showSnackBar(snackBar);
                                }
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Image.asset('assets/images/calendar.png',
                                        width: 40.0, height: 40.0),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Calendar ",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                width: 80.0,
                              ),
                              padding: EdgeInsets.all(30.0),
                              elevation: 0.0,
                              color: Colors.white,
                            ),
                            elevation: 2.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Card(
                              child: RaisedButton(
                                onPressed: () async {
                                  TimeOfDay timeofday = await showTimePicker(
                                      context: context, initialTime: TimeOfDay.now());

                                  if (timeofday.toString() != null) {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        timeofday.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Color(0xFF000000),
                                    );

                                    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
                                  }
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Image.asset('assets/images/time.png',
                                          width: 40.0, height: 40.0),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Time",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  width: 80.0,
                                ),
                                padding: EdgeInsets.all(30.0),
                                color: Colors.white,
                                elevation: 0.0,
                              ),
                              elevation: 2.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            child: RaisedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!

                                    builder: (BuildContext context) {
                                      return new AlertDialog(
                                        title: Text("Dialog"),
                                        content: Text("This is an alert dialog"),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          new FlatButton(
                                            child: new Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });

                                /* new AlertDialog(title: Text("Default Dialog"),actions: <Widget>[
                   new FlatButton(
                     child: new Text('Cancel'),
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                   ),

                 ],);*/
                              },
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset('assets/images/aleart_dialog.png',
                                        width: 40.0, height: 40.0),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 15.0, left: 17.0),
                                      child: Text(
                                        "Alert Dialog",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                width: 80.0,
                              ),
                              padding: EdgeInsets.all(30.0),
                              elevation: 0.0,
                              color: Colors.white,
                            ),
                            elevation: 2.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Card(
                              child: RaisedButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return new Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new ListTile(
                                                leading: new Icon(Icons.settings),
                                                title: new Text('Settings'),
                                                onTap: () {
                                                  final snackBar = SnackBar(
                                                    content: Text(
                                                      'Settings',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor: Color(0xFF000000),
                                                    action: SnackBarAction(
                                                      label: 'Done',
                                                      onPressed: () {
                                                        // Some code to undo the change!
                                                      },
                                                    ),
                                                  );

                                                  Scaffold.of(scaffoldContext)
                                                      .showSnackBar(snackBar);
                                                  Navigator.of(context).pop();
                                                }),
                                            new ListTile(
                                                leading: new Icon(Icons.theaters),
                                                title: new Text('Theme'),
                                                onTap: () {
                                                  final snackBar = SnackBar(
                                                    content: Text(
                                                      'Theme',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor: Color(0xFF000000),
                                                    action: SnackBarAction(
                                                      label: 'Done',
                                                      onPressed: () {
                                                        // Some code to undo the change!
                                                      },
                                                    ),
                                                  );

                                                  Scaffold.of(scaffoldContext)
                                                      .showSnackBar(snackBar);
                                                  Navigator.of(context).pop();
                                                }),
                                            new ListTile(
                                                leading: new Icon(Icons.feedback),
                                                title: new Text('Feedback'),
                                                onTap: () {
                                                  final snackBar = SnackBar(
                                                    content: Text(
                                                      'Feedback',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor: Color(0xFF000000),
                                                    action: SnackBarAction(
                                                      label: 'Done',
                                                      onPressed: () {
                                                        // Some code to undo the change!
                                                      },
                                                    ),
                                                  );

                                                  Scaffold.of(scaffoldContext)
                                                      .showSnackBar(snackBar);
                                                  Navigator.of(context).pop();
                                                }),
                                          ],
                                        );
                                      });
                                },
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/bottem_sheet.png',
                                          width: 40.0, height: 40.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 15.0),
                                        child: Text(
                                          "Bottom Sheet",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  width: 80.0,
                                  alignment: Alignment.center,
                                ),
                                padding: EdgeInsets.all(30.0),
                                color: Colors.white,
                                elevation: 0.0,
                              ),
                              elevation: 2.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            child: RaisedButton(
                              onPressed: () {
                                showLoader();
                              },
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset('assets/images/progress.png',
                                        width: 40.0, height: 40.0),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Progress",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                width: 80.0,
                              ),
                              padding: EdgeInsets.all(30.0),
                              elevation: 0.0,
                              color: Colors.white,
                            ),
                            elevation: 2.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Card(
                              child: RaisedButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'This is SnackBar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Color(0xFF000000),
                                    action: SnackBarAction(
                                      label: 'Done',
                                      onPressed: () {
                                        // Some code to undo the change!
                                      },
                                    ),
                                  );

                                  Scaffold.of(scaffoldContext).showSnackBar(snackBar);
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset('assets/images/snack_bar.png',
                                          width: 40.0, height: 40.0),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Snack Bar",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  width: 80.0,
                                ),
                                padding: EdgeInsets.all(30.0),
                                color: Colors.white,
                                elevation: 0.0,
                              ),
                              elevation: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                })
          ],
        )

       );

    // TODO: implement build
  }

  void showLoader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new CircularProgressIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("Loading..."),
              ),
            ],
          ),
        ),
      ),
    );

    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.pop(context); //pop dialog
    });
  }
}
