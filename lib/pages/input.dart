import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:queuing/pages/info.dart';
import '../Style.dart';
import 'splash.dart';

class InputInfo extends StatefulWidget {
  @override
  State<InputInfo> createState() => _InputinfoState();
}

class _InputinfoState extends State<InputInfo> {
  bool shouldDisplayErrorMessage = false;
  String phoneNumber = '';
  double buttonOpacity = 1.0;
  int newGroupSize = 1;
  bool hasJoinedQueue = false;
  String type = '';
  String time = '';
  int num = 0;
  Map<String,List<int>> groups = <String,List<int>>{
    'A':<int>[45,46,47],
    'B':<int>[39],
    'C':<int>[12],
    'D':<int>[8],
  };
  FlareControls poofController = FlareControls();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Commons.queueingTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'you\'re queueing for',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Commons.whooshFont,
                      color: Commons.queueingTheme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 400,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restaurant_outlined,
                      ),
                      SizedBox(width: 10),
                      Container(
                          height: 50,
                          constraints:
                              BoxConstraints(minWidth: 0, maxWidth: 250),
                          child: FittedBox(
                            child: Text(
                              "Restaurant",
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  width: 390,
                  child: Stack(
                    children: [
                      generateErrorModal(),
                      generatePhoneNumberTextField()
                    ],
                  )
                ),
                SizedBox(height: 30,),
                generateGroupSizeSlider(),
                SizedBox(height: 20),
                generateEnterQueueButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget generateEnterQueueButton() {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setButtonOpacityTo(0.5);
      },
      onTapCancel: () {
        setButtonOpacityTo(1.0);
      },
      onTap: hasJoinedQueue ? null : () {
        joinQueue();
      },
      child: Opacity(
        opacity: buttonOpacity,
        child: Commons.enterQueueButton,
      )
    );
  }
  void joinQueue() async {
    if (!isValidPhoneNumber()) {
      setState(() {
        hasJoinedQueue = false;
        setButtonOpacityTo(1.0);
        shouldDisplayErrorMessage = true;
      });
      return;
    }
    hasJoinedQueue = true;
    if (newGroupSize >= 0 && newGroupSize <= 3) {
      type = 'A';
    } else if (newGroupSize >= 3 && newGroupSize <= 4) {
      type = 'B';
    } else if (newGroupSize >= 5 && newGroupSize <= 6) {
      type = 'C';
    } else{
      type = 'D';
    }
    num = groups[type].isEmpty ? 1 : (groups[type].last % 100)+1;
    groups[type].add(num);
    time = generateEstimatedWaitTime(groups[type].length - 1, 5);
    Navigator.pushNamed(context, '/home',arguments: {'key' : num,'type':type,'time': time});
    Navigator.pushNamed(context, '/info',arguments: {'key' : num,'type':type,'time': time,});
    Navigator.pushNamed(context, '/splash');
  }
  String generateEstimatedWaitTime(int numberOfGroups, int unitQueueTime) {
    int timeToWait = numberOfGroups * unitQueueTime;
    return timeToWait.toString()
            + '-'
            + (timeToWait + unitQueueTime).toString()
            + ' min';
  }
  void setButtonOpacityTo(double opacity) {
    setState(() {
      buttonOpacity = opacity;
    });
  }
  Widget generateGroupSizeSlider() {
    return Container(
      width: 350,
      child: Column(
        children: [
          generateSliderLabel(),
          generateSlider(),
          generateGroupSizeLabel(),
        ],
      ),
    );
  }
  Widget generateGroupSizeLabel() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        newGroupSize.round().toString(),
        style: TextStyle(
          fontSize: 36,
          color: Commons.queueingTheme.primaryColor,
          fontFamily: Commons.whooshFont,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
  Widget generateSliderLabel() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'group size',
        style: TextStyle(
            fontSize: 24,
            color: Commons.queueingTheme.primaryColor,
            fontFamily: Commons.whooshFont
        ),
      ),
    );
  }
  Widget generatePhoneNumberLabel() {
    return Container(
      width: 350,
      height: 50,
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'phone number',
          style: TextStyle(
              fontSize: 24,
              color: Commons.queueingTheme.primaryColor,
              fontFamily: Commons.whooshFont
          ),
        ),
      ),
    );
  }
  Widget generateTextField() {
    return Container(
      height: 70,
      width: 350,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Commons.whooshTextWhite,
            ),
            onChanged: (text) {
              phoneNumber = text;
              if (shouldDisplayErrorMessage) {
                setState(() {
                  shouldDisplayErrorMessage = !isValidPhoneNumber();
                });
              }
            },
            onSubmitted: (text) {
              setState(() {
                shouldDisplayErrorMessage = !isValidPhoneNumber();
              });
            },
          ),
        ),
      )
    );
  }
  bool isValidPhoneNumber() {
    return isNumeric(phoneNumber) && phoneNumber.length == 8;
  }
  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
  Widget generatePhoneNumberTextField() {
    return Column(
      children: [
        generatePhoneNumberLabel(),
        generateTextField(),
      ],
    );
  }
  Widget generateErrorModal() {
    return Opacity(
      opacity: shouldDisplayErrorMessage ? 1 : 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Commons.queueingTheme.errorColor,
        ),
        width: 390,
        height: 160,
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Text(
                '*should have 8 digits',
                style: TextStyle(
                    fontSize: 24,
                    color: Commons.whooshErrorDarkRed,
                    fontFamily: Commons.whooshFont
                ),
              ),
            )
        ),
      ),
    );
  }
  Widget generateSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Commons.whooshTextWhite,
        inactiveTrackColor: Commons.whooshTextWhite,
        inactiveTickMarkColor: Commons.whooshTextWhite,
      ),
      child: Slider(
        value: newGroupSize.roundToDouble(),
        min: 1,
        max: 10,
        divisions: 10,
        onChanged: (double value) {
          playPoof();
          setState(() {
            newGroupSize = value.round();
          });
          
        },
      ),
    );
  }

  void playPoof() {
    poofController.play('poof');
  }
}
