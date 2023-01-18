import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/cart_component.dart';
import 'components/products_component.dart';
import 'components/search_component.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

int initvalue = 0;

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              (initvalue != 2)
                  ? const Text("   Cupertion Store",
                      style:
                          TextStyle(fontSize: 28,color: CupertinoColors.black ,fontWeight: FontWeight.bold))
                  : const Text("   Shopping Cart",
                      style:
                          TextStyle(fontSize: 28, color: CupertinoColors.black ,fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.778,
                width: double.infinity,
                color: Colors.white,
                child: IndexedStack(index: initvalue, children: const [
                  ProductComponent(),
                  SearchComponent(),
                  CartComponent(),
                ]),
              ),
              CupertinoTabBar(
                backgroundColor: Colors.grey.shade100,
                  currentIndex: initvalue,
                  onTap: (val) {
                    setState(() {
                      initvalue = val;
                    });
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home), label: "Homepage"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search), label: "Search"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.cart), label: "Cart"),
                  ]),
            ],
          )),
    );
  }
}
