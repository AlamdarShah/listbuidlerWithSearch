import 'package:flutter/material.dart';
import 'package:listbuilder/ProductCard.dart';
import 'package:listbuilder/CartScreen.dart';
import 'model.dart';
import 'AddItem.dart';
import 'ProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List searchList = [];
  TextEditingController _search = TextEditingController();
  @override
  initState() {
    searchList = Item.items;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = Item.items;
    } else {
      results = Item.items
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      searchList = results;
    });
  }

  String isSearchFieldEmpty = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MyItems"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderDetails()));
                },
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  controller: _search,
                  onChanged: (value) {
                    setState(() {
                      isSearchFieldEmpty = value;
                      _runFilter(value);
                    });
                  }, 
                  decoration: InputDecoration(
                      //hintText: "Search",
                      labelText: "Search",
                      prefixIcon: Icon(Icons.search_rounded)),
                ),
              ),
              Column(
                  children: isSearchFieldEmpty == ''
                      ? List.generate(Item.items.length,
                          (index) => ProductPage(item: Item.items[index]))
                      : List.generate(searchList.length,
                          (index) => ProductPage(item: searchList[index]))),
              // ListView.builder(
              //   physics:NeverScrollableScrollPhysics(),
              //   itemCount: Item.items.length,
              //   itemBuilder: (context, index) {
              //     return ProductPage(item:Item.items[index]);
              //   }
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
