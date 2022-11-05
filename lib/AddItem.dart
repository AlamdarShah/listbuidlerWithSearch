import 'package:flutter/material.dart';
import 'package:listbuilder/ProductCard.dart';
import 'model.dart';
import 'home.dart';
import 'ProductCard.dart';

class ProductPage extends StatefulWidget {
  ProductPage({required this.item});

  final Products item;
  static List<CartItem> cartList = [];
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController _quantity = TextEditingController();

  TextEditingController _rate = TextEditingController();

  TextEditingController _total = TextEditingController();
  int quantity = 0;
  double rate = 0;
  double total = 0;
  @override
  void initState() {
    rate = double.parse(widget.item.rate.split(':').last);
    _rate.text = rate.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ProductPage.cartList.isNotEmpty) {
      for (var element in ProductPage.cartList) {
        if (element.name.toLowerCase() == widget.item.name.toLowerCase()) {
          widget.item.quantity = element.quantity1;
          break;
        }
      }
    }
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
        leading: widget.item.quantity == null
            ? Container(
                width: 20,
                height: 20,
              )
            : widget.item.quantity == 0
                ? Container(
                    width: 20,
                    height: 20,
                  )
                : CircleAvatar(
                    radius: 20, child: Text(widget.item.quantity.toString())),
        title: Text(widget.item.name),
        subtitle: Text(widget.item.rate),
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _quantity,
                          autofocus: true,
                          onChanged: ((value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                quantity = int.parse(value);
                                total = quantity * rate;
                                _total.text = total.toString();
                              });
                            } else {
                              quantity = 0;
                              total = quantity * rate;
                              _total.text = total.toString();
                            }
                          }),
                          decoration: InputDecoration(
                            label: Text("Quantity"),
                            hintText: "Qunatity",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: _rate,
                          decoration: InputDecoration(
                            label: Text("Rate"),
                            hintText: "Rate",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: _total,
                          decoration: InputDecoration(
                            label: Text("Total"),
                            hintText: "Total",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.green,
                          child: Text("Save"),
                          onPressed: () {
                            CartItem cartItem = CartItem(
                                name: widget.item.name,
                                quantity1: quantity,
                                rate1: rate,
                                total1: total);
                            ProductPage.cartList.add(cartItem);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );

        },
        
        ),
       ),
    );    
  }
}
