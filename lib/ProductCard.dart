import 'package:flutter/material.dart';
import 'package:listbuilder/model.dart';
import 'package:listbuilder/AddItem.dart';

class CartItem extends StatefulWidget {
  //const CartItem({super.key});
  int quantity1;
  double rate1, total1;
 String name;
// CartItem({required this.quantity1,required this.rate1,required this.total1,name});
  CartItem(
      {required this.name, required this.quantity1, required this.rate1, required this.total1});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late List <dynamic> data;
 
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: [
        Card(
          child: ListTile(
            leading: Text(" Price ${widget.rate1}"),
            title: Text(" No of Items ${widget.quantity1}"),
            subtitle: Text("total Price ${widget.total1}"),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                setState(() {
                  // ProductPage.cartList.removeAt(index);
                  // ProductPage.cartList;
                });
              },
            ),
          ),
        ),
      ],
    ),
    );
  }
}
