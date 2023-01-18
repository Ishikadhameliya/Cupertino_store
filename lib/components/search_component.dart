import 'package:cupertino_store/res/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: CupertinoSearchTextField(
                style: TextStyle(color: Colors.black),
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: global.search
                  .map((e) => Column(
                children: [
                  Row(
                    children: [
                      Image.network("${e['image']}", height: 80,width: 150,),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${e['name']}",style: const TextStyle(color: CupertinoColors.black),),
                          Text("PR. ${e['price']}",style: const TextStyle(color: CupertinoColors.black),)
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
              ),)
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}