import 'package:flutter/material.dart';

import 'package:test_/homepage/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double counter = 0;
  addtocart(int i) {
    setState(() {
      counter += products[i]["price"];
    });
  }

  removefromcart(int i) {
    setState(() {
      counter -= products[i]["price"];
    });
  }

  List<Map> products = [
    {"title": "iphone", "desc": "15pro", "price": 15.000},
    {"title": "samsung", "desc": "s20", "price": 30.000},
    {"title": "samsung", "desc": "s20", "price": 45.000},
    {"title": "samsung", "desc": "s20", "price": 15.000},
    {"title": "samsung", "desc": "s20", "price": 15.000},
    {"title": "samsung", "desc": "s20", "price": 15.000}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
              fontFamily: 'Ubuntu', fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          Stack(clipBehavior: Clip.none, children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            Container(
              child: Positioned(
                top: 2,
                right: 15,
                child: SizedBox(
                  width: 40,
                  height: 15,
                  child: counter >= 0
                      ? Text(
                          "$counter",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      : const Text('0'),
                ),
              ),
            ),
          ]),
        ],
      ),
      drawer: Drawer(
          child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .25,
              child: const UserAccountsDrawerHeader(
                accountName: Text("aymen"),
                accountEmail: Text("test@gmail.com"),
                currentAccountPicture: CircleAvatar(child: Text("A")),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.notifications_active_rounded),
              title: const Text("Enable notifications"),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text("About us"),
            ),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
            ),
          ],
        ),
      )),
      body: GridView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5, crossAxisCount: 2),
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCard(
                plus: () {
                  if (counter >= 0) {
                    addtocart(index);
                  }
                },
                minus: () {
                  if (counter > 0) {
                    removefromcart(index);
                  }
                },
                counter: counter,
                products: products,
                i: index,
              ),
            );
          })),
    );
  }
}
