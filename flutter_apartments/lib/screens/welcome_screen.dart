import 'package:flutter/material.dart';
import 'package:speech_bubble/speech_bubble.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../ui_widgets/size_config.dart';
import 'package:align_positioned/align_positioned.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // Center widget A, and then align B to the bottom of that.
    return Scaffold(
      appBar: AppBar(title: const Text('Center Below Example')),
      body: Center(
        child: AlignPositioned.relative(widgetA(), widgetB(),
            moveByContainerHeight: 0.5,
            moveByChildHeight: 0.5,
            rotateDegrees: 10),
      ),
    );
  }

  Container widgetA() => Container(
        color: Colors.red,
        child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi "
            "ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
            "in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25)),
      );

  Container widgetB() => Container(
      color: Colors.blue,
      child: Text(
          "Excepteur sint occaecat.\n"
          "Duis aute irure dolor in reprehenderit.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16)));
}

class ValuePropImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Demo();
    SizeConfig().init(context);
    var fontSize = SizeConfig.safeBlockHorizontal * 15;
    return Expanded(
        child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        AlignPositioned.relative(
            Icon(
              Icons.people,
              size: fontSize,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(fontSize / 2.5, 0, 0, 0),
                child: Align(
                  child: buildSpeechBubble(context),
                  alignment: Alignment.topLeft,
                )),
            moveByContainerHeight: -.3),
        Positioned(
            left: fontSize,
            child: Icon(
              Icons.add,
              size: fontSize,
            )),
        AlignPositioned.relative(
            Positioned(
                left: fontSize * 2,
                child: Icon(
                  Icons.home,
                  size: fontSize,
                )),
            buildHouseSpeechBubble(context, fontSize),
            moveByContainerHeight: .09,
            moveByContainerWidth: .12),
        Positioned(
            left: fontSize * 3,
            child: Icon(
              Icons.drag_handle,
              size: fontSize,
            )),
        Positioned(
            left: fontSize * 4,
            child: AutoSizeText(
              '\$\$\$',
              style: TextStyle(
                  fontSize: fontSize,
                  color: Theme.of(context).textTheme.bodyText2.color),
            )),
      ],
    ));
    // return Column(children: <Widget>[
    //   AlignPositioned.relative(
    //       AlignPositioned.relative(buildEquation(fontSize, context),
    //           buildHouseSpeechBubble(context, fontSize),
    //           moveByContainerHeight: 1.0),
    //       buildSpeechBubble(context),
    //       moveByContainerHeight: -0.8)
    // ]);
  }

  Row buildEquation(double fontSize, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Icon(
            Icons.people,
            size: fontSize,
          ),
          Icon(
            Icons.add,
            size: fontSize,
          ),
          // AlignPositioned.relative(
          Icon(
            Icons.home,
            size: fontSize,
          ),
          // buildHouseSpeechBubble(context, fontSize),
          // moveByContainerHeight: 0.5,
          // moveByChildHeight: 2.5),

          Icon(Icons.drag_handle, size: fontSize),
          AutoSizeText(
            '\$\$\$',
            style: TextStyle(
                fontSize: fontSize,
                color: Theme.of(context).textTheme.bodyText2.color),
          )
        ]),
      ],
    );
  }

  Row buildHouseSpeechBubble(BuildContext context, double fontSize) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      // Opacity(
      //     opacity: 0.0,
      //     child: Row(children: <Widget>[
      //       Icon(
      //         Icons.people,
      //         size: fontSize,
      //       ),
      //       Icon(
      //         Icons.add,
      //         size: fontSize,
      //       ),
      //     ])),
      SpeechBubble(
        nipLocation: NipLocation.TOP_LEFT,
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Find a cool house!",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      )
    ]);
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
          Text("You ready to save some BAH?",
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
          children: <Widget>[
            AlignPositioned.relative(titleSection, ValuePropImage(),
                moveByContainerHeight: 1.1)
          ],
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
