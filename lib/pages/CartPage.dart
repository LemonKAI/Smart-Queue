import 'package:flutter/material.dart';
import 'package:queuing/Style.dart';
import '../food.dart';
import 'SuccessPage.dart';
class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _cartPageState();
}

class _cartPageState extends State<CartPage> {
  int sum = 0;
  double totalprice = 0.0;
  List<food> _cartList;
  List<food> _foodList = [
    food("Beef","beef",118),
    food("Lamb","lamb1",288),
    food("Knuckle","knuckle",288),
    food("Lobster","lobster",298),
    food("Short Ribs","ribs",278)
  ];
  Map<String,int> foodCount = 
    {'Beef' : 0,
    'Lamb' : 0,
    'Knuckle' : 0,
    'Lobster' :0,
    'Short Ribs' :0};
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if(arguments != null && _cartList == null){
      sum = 0;
      _cartList = arguments['cartList'];
      foodCount = 
      {'Beef' : 0,
      'Lamb' : 0,
      'Knuckle' : 0,
      'Lobster' :0,
      'Short Ribs' :0};
      for(int i = 0; i < _cartList.length;i++){
        foodCount[_cartList[i].name]++;
        sum++;
        totalprice += _cartList[i].price;
      }
    }
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
                            IconButton(onPressed: (){Navigator.pop(context,
                            _cartList
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
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("YOUR CART", style: TextStyle(
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
                        if(sum != 0)placesHeader(),
                        for(int i = 0; i < _foodList.length;i++) 
                          placesWidget(_foodList[i]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total(${sum} items)" ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vfont',
                              fontSize: 18
                            ),
                            ),
                            Text('\$${totalprice.toStringAsFixed(2)}',style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),)
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('+Tips',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Vfont'
                            ),),
                            Text('\$${(totalprice*0.1).toStringAsFixed(2)}',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey
                            ),)
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Payable',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Vfont'
                            ),),
                            Text('\$${(totalprice * 1.1).toStringAsFixed(2)}',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,

                            ),)
                          ],
                        ),
                        SizedBox(height: 25,),
                        
                        Text('Have a Promo Code?',style: TextStyle(
                          color: blue,
                          fontFamily: 'Vfont',
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: openSuccessPage,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              color: greenBtn
                            ),
                            child: Text('Check Out',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  ],
              ),
            ),
          )],
      ),
    );
  }














  Widget placesHeader(){
    return Row(
      children: [
        SizedBox(
          width: 100,
        ),
        Expanded(
          child: 
            Text("Items", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
          
        ),
        SizedBox(width: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35.0),
              decoration: BoxDecoration(
                  border: Border.all(color: black),
              ),
              child: Text('Quantity', style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ],
        );
  }

  Widget placesWidget(food f)
  {
    String foodname = f.getName();
    if(foodCount[foodname] == 0) return SizedBox(height: 0,);

    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/${f.getimg()}.png")
              )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${f.getName()}", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),
              Row(
                children: [
                  Icon(Icons.star, size: 20, color: Colors.orange,),
                  Icon(Icons.star, size: 20, color: Colors.orange,),
                  Icon(Icons.star, size: 20, color: Colors.orange,),
                  Icon(Icons.star, size: 20, color: Colors.orange,),
                  Icon(Icons.star, size: 20, color: Colors.orange,),
                ],
              ),
              Text("${foodCount[foodname]} x \$${(f.price).toStringAsFixed(2)} = \$${(foodCount[foodname] * f.price).toStringAsFixed(2)}", style: TextStyle(
                  fontSize: 12
              ),)
            ],
          ),
        ),
        SizedBox(width: 10,),
        Row(
          children: [
            
            IconButton(onPressed: (){
              setState(() {
                if(foodCount[foodname] > 0){
                  foodCount[foodname]--;
                  sum--;
                  final cartIndex = _cartList.indexWhere((element) => element.name == foodname);
                  if(cartIndex != -1){
                    _cartList.removeAt(cartIndex);
                    print('Opps');
                  }
                totalprice -= f.price;
                print(_cartList.length);
                }
                
              });
            }, icon: Icon(Icons.minimize_rounded,size: 10,)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: black),
              ),
              child: Text('${foodCount[foodname]}', style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700
              ),),
            ),
            IconButton(onPressed: (){
              setState(() {
                if(foodCount[foodname] < 10){
                  totalprice += f.getprice();
                  sum++;
                  foodCount[foodname]++;
                  _cartList.add(f);
                  print(_cartList.length);
                }
                
              });
            }, icon: Icon(Icons.add,size: 10,),
            ),
          ],
        )
      ],
    );
  }
  void openSuccessPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage()));
  }
}