import 'package:cupertino_store/res/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductComponent extends StatefulWidget {
  const ProductComponent({Key? key}) : super(key: key);

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: global.product
            .map((e) => Column(
          children: [
            Row(
              children: [
                Image.network("${e['image']}", height: 80,width: 150,),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${e['name']}",style: const TextStyle(color: Colors.black),),
                    Text("PR. ${e['price']}",style: const TextStyle(color: Colors.black),)
                  ],
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        e['bool'] = !e['bool'];
                        if (e['bool'] == true) {
                          global.allproduct.add(e);
                          global.total = 0;
                          for (int i = 0;
                          i < global.allproduct.length;
                          i++) {
                            global.total = global.total +
                                global.allproduct[i]['price'];
                          }
                        } else {
                          global.allproduct.remove(e);
                          global.total = 0;
                          for (int i = 0;
                          i < global.allproduct.length;
                          i++) {
                            global.total = global.total +
                                global.allproduct[i]['price'];
                          }
                        }
                      });
                    },
                    child: (e['bool'] == false)
                        ? const Icon(CupertinoIcons.add_circled)
                        : const Icon(CupertinoIcons.add_circled_solid)),
                const SizedBox(width: 15),
              ],
            ),
            const Divider(thickness: 1),
          ],
        ))
            .toList(),
      ),
    );
  }
}