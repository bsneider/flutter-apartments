import 'package:flutter/material.dart';
import 'package:flutter_apartments/api/mock_apartments.dart';
import 'package:provider/provider.dart';

class WeclomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weclome!', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[titleSection, image],
        )
        // new Container(
        //   padding: const EdgeInsets.all(20.0),
        //   child: new Column(
        //     children: <Widget>[
        //       const Text('He\'d have you all unravel at the'),
        //       const Text('Heed not the rabble'),
        //       const Text('Sound of screams but the'),
        //       const Text('Who scream'),
        //       const Text('Revolution is coming...'),
        //       const Text('Revolution, they...'),
        //       Container(
        //         color: Colors.lightBlue,
        //         child: Column(
        //           children: [
        //             Expanded(
        //               child: Padding(
        //                 padding: const EdgeInsets.all(32),
        //                 child: _AptList(),
        //               ),
        //             ),
        //             Divider(height: 4, color: Colors.black),
        //             // _CartTotal()
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class _AptList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var apts = [Sample("GreenGoblin"), Sample("RedRum")];

    return ListView.builder(
      itemCount: apts.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          apts[index].title,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class Sample {
  String title;
  Sample(this.title) : assert(title != null);
}

const double iconSize = 60;
Widget image = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Icon(
      Icons.people,
      size: iconSize,
    ),
    Icon(
      Icons.add,
      size: iconSize,
    ),
    Icon(
      Icons.home,
      size: iconSize,
    ),
    Icon(Icons.drag_handle, size: iconSize),
    Text(
      '\$\$\$',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: iconSize),
    ),
  ],
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'BLUF: What We Do',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20 //20 logical pixels default is 14
                    ),
              ),
            ),
            //row and second part is larger factor
            Row(
              children: <Widget>[
                Container(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Summary:', style: TextStyle(fontSize: 16))),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'We help you find a mil roomate so you can save YOUR BAH. Here\'s a simple math equation for you...',
                    style: TextStyle(
                        // color: Colors.grey[500],
                        fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);
