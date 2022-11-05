class Products {
   late String name;
   late String rate;
   late int quantity=0; 
  

  Products({ required this.name, required this.rate,quantity});
}

class Item{
  static List<Products> items=[
     Products(
      name:"Pizza",
      rate:"Rs:1200"
     ) ,
     Products(
      name:"Zinger",
      rate:"Rs:399",
     ) ,
     Products(
      name:"Pasta",
      rate:"Rs:600"
     ) ,
     Products(
      name:"Salad",
      rate:"Rs:700"
     ) ,
     Products(
      name:"Burger",
      rate:"Rs:250"
     ) ,
     Products(
      name:"Cool Drink",
      rate:"Rs:150"
     ) ,
   

  ];
}