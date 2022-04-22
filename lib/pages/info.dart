import 'package:flutter/material.dart';
import 'dart:math';
import '../Style.dart';
class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int ticket_number = 0;
  String estimatedWait = '';
  String type = '';
  
    
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  String generateEstimatedWaitTime(int numberOfGroups, int unitQueueTime) {
    int timeToWait = numberOfGroups * unitQueueTime;
    return timeToWait.toString()
            + '-'
            + (timeToWait + unitQueueTime).toString()
            + ' min';
  }
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if(arguments != null)
    {estimatedWait = arguments['time'];
    ticket_number = arguments['key'];
    type = arguments['type'];
    }
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        
        children: <Widget>[
          Stack(children: [
            Container(
              //  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              color: Colors.redAccent,
              width: 600.0,
              height: 190.0,
              child: Column(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                      child: Image(
                        image: AssetImage('asset/images/onewayqueue.png'),
                        height: 140.0,
                        width: 160.0,
                      )),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    color: Colors.redAccent,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 27,
                      color: Colors.grey,
                    )),
              ],
            )
          ]),
          Container(
            width: 400.0,
            height: 160.0,
            //  color: Colors.green,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Thank you for waiting",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Vfont',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Estimated time:',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Vfont',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 70,
                    width: 250,
                    constraints: BoxConstraints(minWidth: 0, maxWidth: 250),
                    child: FittedBox(
                      child: Text(
                        estimatedWait,
                        style: TextStyle(
                          fontSize: 64,
                          fontFamily: Commons.whooshFont,
                          fontWeight: FontWeight.w700,
                          color: Commons.queueingTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80.0,
            height: 40.0,
            child: Image(
              image: AssetImage('asset/images/dot.png'),
            ),
          ),
          Container(
            width: 160.0,
            height: 80.0,
            child: Column(
              children: <Widget>[
                Container(
                  //     width: 200.0,
                  // height: 40.0,
                  child: Text(
                    "Here is position",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
                  width: 180.0,
                  height: 40.0,
                  child: Text(
                    "in the Queue",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ClipOval(
              child: Container(
                color: Colors.black,
                height: 100.0, // height of the button
                width: 100.0, // width of the button
                child: Center(
                    child: Text('$type-${ticket_number}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Vfont'))),
              ),
            ),
          ),
          Container(
            width: 250.0,
            height: 150.0,
            padding: const EdgeInsets.fromLTRB(35.0, 40.0, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 240.0,
                  height: 25.0,
                  child: Text(
                    "We wil text you when we're",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  width: 240.0,
                  height: 60.0,
                  child: Text(
                    "almost ready to see you.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
