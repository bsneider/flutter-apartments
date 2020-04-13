import 'package:flutter/material.dart';
import 'package:speech_bubble/speech_bubble.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../ui_widgets/size_config.dart';

class ValuePropImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var fontSize = SizeConfig.safeBlockHorizontal * 10;
    return Column(children: <Widget>[
      buildSpeechBubble(context),
      buildEquation(fontSize, context),
      buildHouseSpeechBubble(context)
    ]);
  }

  Row buildEquation(double fontSize, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.people,
          size: fontSize,
        ),
        Icon(
          Icons.add,
          size: fontSize,
        ),
        Icon(
          Icons.home,
          size: fontSize,
        ),
        Icon(Icons.drag_handle, size: fontSize),
        AutoSizeText(
          '\$\$\$',
          style: TextStyle(
              fontSize: fontSize,
              color: Theme.of(context).textTheme.bodyText2.color),
        ),
      ],
    );
  }

  SpeechBubble buildHouseSpeechBubble(BuildContext context) {
    return SpeechBubble(
      nipLocation: NipLocation.TOP_LEFT,
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AutoSizeText(
            "Find a cool house!",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }

  SpeechBubble buildSpeechBubble(BuildContext context) {
    return SpeechBubble(
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
          AutoSizeText("You ready to save some BAH?",
              style: Theme.of(context).textTheme.headline1),
        ],
      ),
    );
  }
}

class WeclomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText('Weclome!',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[titleSection, ValuePropImage()],
        ));
  }
}

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
              child: AutoSizeText(
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
                      child: AutoSizeText('Summary:',
                          style: TextStyle(fontSize: 16))),
                ),
                Expanded(
                  flex: 1,
                  child: AutoSizeText(
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
