import 'package:flutter/material.dart';
import 'package:later_link_list_app/flutter_staggered_grid_view_tutorial_1.dart';
import 'package:later_link_list_app/flutter_staggered_grid_view_tutorial_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LaterLinkList',
      debugShowCheckedModeBanner: false,
      home: StaggeredTutorial2(),
      theme: ThemeData(
          primaryColor: Colors.black
      ),
    );
  }
}