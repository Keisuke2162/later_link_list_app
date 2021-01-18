import 'package:flutter/material.dart';
import 'package:later_link_list_app/flutter_staggered_grid_view_tutorial_1.dart';
import 'package:later_link_list_app/flutter_staggered_grid_view_tutorial_2.dart';
import 'package:later_link_list_app/ogp_viewer.dart';
import 'package:later_link_list_app/thumbnails_viewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LaterLinkList',
      debugShowCheckedModeBanner: true,
      home: ThumbnailsViewer(),
      theme: ThemeData(
          primaryColor: Colors.lightBlue
      ),
    );
  }
}