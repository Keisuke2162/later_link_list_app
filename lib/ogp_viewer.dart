import 'package:flutter/material.dart';
import 'package:later_link_list_app/helpers/fetch_preview.dart';

class OgpViewer extends StatefulWidget {
  @override
  _ogpViewer createState() => _ogpViewer();
}

class _ogpViewer extends State<OgpViewer> {
  String url;   // 入力したURL
  var data;     // URLから取得した情報

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OGP Viewer'),
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
          _buildPreviewArea(),
          SizedBox(height: 20.0),
          RaisedButton(onPressed: (){
            FetchPreview().fetch(url).then((data){
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

  _buildPreviewArea() {

    if (data == null) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.lightBlue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(data['image'], width: double.infinity / 2, fit: BoxFit.fitWidth),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data['title'], style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 4.0,),
                  Text(data['description']),
                  SizedBox(height: 15.0,),
                  Text(url, style: TextStyle(color: Colors.grey, fontSize: 12.0),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

