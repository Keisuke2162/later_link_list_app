import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredTutorial2 extends StatefulWidget {
  @override
  _StaggeredExample2 createState() => _StaggeredExample2();

}

class _StaggeredExample2 extends State<StaggeredTutorial2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('GridView Photo'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Icon(Icons.message),
          ),
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 4,
        children: List.generate(9, (index) {
          return _Tile(index);
        }),
        staggeredTiles: List.generate(9, (index){
          return StaggeredTile.fit(2);
        }),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  _Tile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular((5))),
              child: Image.asset('assets/${1 + index}.jpg'),
            ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0),
          width: double.infinity - 15.0,
          child: Text(
            'TEST',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );

    return Container(
      //margin: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10.0, bottom: 30.0, right: 10.0, left: 10.0),
      /*
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular((5))),
        child: Image.asset('assets/${1 + index}.jpg'),
      )
       */
    );
  }
}