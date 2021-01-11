import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredTutorial extends StatefulWidget {
  @override
  _StaggeredExample createState() => _StaggeredExample();

}


class _StaggeredExample extends State<StaggeredTutorial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StaggeredExample'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: const <StaggeredTile>[
            const StaggeredTile.count(3, 2),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(2, 1),
            const StaggeredTile.count(1, 2),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(1, 2),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(3, 1),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(4, 1),
          ],
          children: [
            const _SampleTile(Colors.green),
            const _SampleTile(Colors.lightBlue),
            const _SampleTile(Colors.amber),
            const _SampleTile(Colors.brown),
            const _SampleTile(Colors.deepOrange),
            const _SampleTile(Colors.indigo),
            const _SampleTile(Colors.red),
            const _SampleTile(Colors.pink),
            const _SampleTile(Colors.purple),
            const _SampleTile(Colors.blue),
            const _SampleTile(Colors.black),
            const _SampleTile(Colors.red),
            const _SampleTile(Colors.brown),
          ],
        ),
      ),
    );
  }
}

class _SampleTile extends StatelessWidget {
  const _SampleTile(this.backgroundColor);
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
          ),
        ),
      ),
    );
  }
}

