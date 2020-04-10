import 'package:flutter/material.dart';
import 'package:speech_bubble/speech_bubble.dart';
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
        ));
  }
}

Widget speechBubble = SpeechBubble(
  nipLocation: NipLocation.BOTTOM_LEFT,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        Icons.favorite,
        color: Colors.white,
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
      ),
      Text(
        "You ready to save some BAH?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ],
  ),
);

Widget houseBubble = SpeechBubble(
  nipLocation: NipLocation.TOP_LEFT,
  padding: EdgeInsets.all(10.0),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(4.0),
      ),
      Text(
        "Find a cool house!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ],
  ),
);

const double iconSize = 60;
Widget image = Column(children: <Widget>[speechBubble, equation, houseBubble]);

Widget equation = Row(
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
    ],
  ),
);
