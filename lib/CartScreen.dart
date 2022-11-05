import 'package:flutter/material.dart';
import 'AddItem.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Move to Home"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined),onPressed: () {
          Navigator.pop(context);
        },),
      ),
        body: ListView.builder(
            itemCount: ProductPage.cartList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading:
                      Text("No items ${ProductPage.cartList[index].quantity1}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      setState(() {
                        ProductPage.cartList.removeAt(index);
                        // ProductPage.cartList;
                      });
                    },
                  ),
                  title: Text(ProductPage.cartList[index].name),
                  subtitle: Text(ProductPage.cartList[index].total1.toString()),
                ),
              );
            }));
  }
}
