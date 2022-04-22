import 'package:flutter/material.dart';
import 'package:queuing/Style.dart';
import 'package:queuing/pages/CartPage.dart';
import '../food.dart';
class RestaurantPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "VFont",
      ),
      home: restaurantPage(),
    );
  }
}

class restaurantPage extends StatefulWidget {
  
  @override
  State<restaurantPage> createState() => _restaurantPageState();
}

class _restaurantPageState extends State<restaurantPage> {
  get children => null;
  
  List<food> _cartList = [];
  List<food> _foodList = [
    food("Beef","beef",118),
    food("Lamb","lamb1",288),
    food("Knuckle","knuckle",288),
    food("Lobster","lobster",298),
    food("Short Ribs","ribs",278)
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
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
                            IconButton(onPressed: (){Navigator.pop(context);},
                             icon: Icon(Icons.arrow_back,color: Colors.white,)
                            ),
                          ],
                        ),
                        SizedBox(height: 150,),
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
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Recommendation", style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                            ),),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        placesWidget(_foodList[0].getimg(), _foodList[0].getName(), context)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Dishes", style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                            ),),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(int i = 1; i < _foodList.length;i++)(
                                dishWidget(_foodList[i])
                              )
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 100,),
                ],
              ),
            ),
            
          ),
          
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: openCartPage,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: greenBtn
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 18,),
                                Text("CART",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 45,vertical: 5),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          color: greenBtn.withOpacity(0.7)
                        ),
                      )
                    ]
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Container dishWidget(food f){
    return Container(
      width: 120,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/${f.img}.png")
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${f.name}",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 5,),
              Text("\$ ${f.price}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black
                ),),
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){_cartList.add(f);},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: black)
                    ),
                    child: Text("+ Cart",style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
  Row placesWidget(String img, String name,BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            
              image:
                  DecorationImage(image: AssetImage("asset/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "Lorem ipsum sits dolar amet is for publishing",
                
                style: TextStyle(fontSize: 12,fontFamily: 'VFont',),
              ),
              Text(
                "\$${_foodList[0].price}",
                
                style: TextStyle(fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {_cartList.add(_foodList[0]);},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: greenBtn),
            child: Text(
              "+ Cart",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
  void openCartPage(){
    // final res = await 
    Navigator.pushNamed(context,'/cartpage',arguments: {'cartList': _cartList,})
    .then((value){
      setState(() {
        _cartList = _cartList;
      });
    })
    ;
    //_cartList = res;
    print(_cartList.length);
  }
}