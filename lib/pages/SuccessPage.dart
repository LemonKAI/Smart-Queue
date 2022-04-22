import 'package:flutter/material.dart';
import '../Style.dart';
class SuccessPage extends StatefulWidget {

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: blue,
                    image: DecorationImage(
                      image: AssetImage("asset/images/KAIBIG.jpg"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){Navigator.pop(context,
                          );},
                           icon: Icon(Icons.arrow_back,color: Colors.white,)
                          ),
                        ],
                      ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text("Restaurant",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: "Pacifico"
                              ),),
                              SizedBox(height: 10,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Text(" 255 Reviews", style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Pacifico",
                                    fontSize: 14,
                                  ),),
                                ]
                              )
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent,size: 35,),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("Lorem ipsum dolar sits amet is used in print industry",style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.monetization_on,
                            size: 150,
                            color: greenBtn,),
                            SizedBox(height: 10,),
                            Text('Pay by cash',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vfont',
                              fontSize: 18
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 30, 30, 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.payment_rounded,
                            size: 150,
                            color: greenBtn,),
                            SizedBox(height: 10,),
                            Text('Pay by online',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vfont',
                              fontSize: 18
                            ),)
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                )
                ],
            ),
          )],
      ),
    );
  
  }
}