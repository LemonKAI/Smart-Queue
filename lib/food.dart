class food{
  
  dynamic name;
  dynamic img;
  dynamic price;
  food.empty(){
    name = "";
    price = 0.0;
    img = "";
  }
  food(String name,String img,double price){
    this.name = name;
    this.img = img;
    this.price = price;
  }
  dynamic getprice(){
    return this.price;
  }
  dynamic getName(){
    return this.name;
  }
  dynamic getimg(){
    return this.img;
  }
}