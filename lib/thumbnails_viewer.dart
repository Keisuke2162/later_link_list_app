import 'dart:io';

import 'package:flutter/material.dart';
import 'package:later_link_list_app/helpers/fetch_thumbnail_list.dart';

class ThumbnailsViewer extends StatefulWidget {
  @override
  _thumbnailViewer createState() => _thumbnailViewer();
}

class _thumbnailViewer extends State<ThumbnailsViewer> {
  String url;   // 入力したURL
  var data;     // URLから取得した情報

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thumbnails Viewer'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                url = value;
              },
            ),
          ),
          _buildThumbnailsArea(),
          SizedBox(height: 20.0),
          RaisedButton(onPressed: (){
            FetchThumbnailList().fetch(url).then((data){
              setState(() {
                this.data = data;
              });
            });
          },
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text('Preview'),
          ),
        ],
      ),
    );
  }

  _buildThumbnailsArea() {

    if (data == null) {
      print("Not Thumbnails");
      return Container();
    }
    return Flexible(
      child: ListView.builder(
        itemCount: data['thumbs'].length,
        itemBuilder: (context, index) {
          return Image.network(_validate(data['thumbs'][index]),);
        },
      ),
    );
  }

  _validate(String url) {
    if (url?.startsWith('http:') == true || url?.startsWith('https:') == true) {
      return url;
    }
    else {
      return 'http:$url';
    }
  }
}

