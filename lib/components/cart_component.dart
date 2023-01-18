import 'package:cupertino_store/res/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({Key? key}) : super(key: key);

  @override
  State<CartComponent> createState() => _CartComponentState();
}

DateTime initialDate = DateTime.now();
String SelectedDate = '';
int SelectedHour = 0;

class _CartComponentState extends State<CartComponent> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
           CupertinoTextField(
             style: const TextStyle(color: Colors.black),
             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),boxShadow: [const BoxShadow(color: Colors.grey,offset: const Offset(0,0),spreadRadius: 2,blurRadius: 4)]),
            prefix: const Icon(Icons.person,color: Colors.grey,),
            placeholder: "Enter Name",
             placeholderStyle: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
           CupertinoTextField(
             style: const TextStyle(color: Colors.black),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),boxShadow: [const BoxShadow(color: Colors.grey,offset: const Offset(0,0),spreadRadius: 2,blurRadius: 4)]),
            prefix: const Icon(Icons.email,color: Colors.grey,),
            placeholder: "Enter Email",
            placeholderStyle: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
           CupertinoTextField(
             style: const TextStyle(color: Colors.black),
             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),boxShadow: [const BoxShadow(color: Colors.grey,offset: const Offset(0,0),spreadRadius: 2,blurRadius: 4)]),
            prefix: const Icon(Icons.location_on_sharp,color: Colors.grey,),
            placeholder: "Enter Location",
             placeholderStyle: const TextStyle(color: Colors.grey),
           ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Icon(Icons.access_time_rounded,color: Colors.black,),
              const Text(" Delivery time", style: TextStyle(color: Colors.black)),
              const Spacer(),
              Text(SelectedDate, style: const TextStyle(color: Colors.black)),
              const SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.black,
            height: 200,
            width: double.infinity,
            child: CupertinoDatePicker(
              initialDateTime: initialDate,
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: (val) {
                setState(() {
                  int SelectedHour = 0;
                  if (val != null) {
                    if (val.hour > 12) {
                      setState(() {
                        SelectedHour = (val.hour) - 12;
                      });
                    } else {
                      SelectedHour = val.hour;
                    }
                  }
                  SelectedDate =
                  ' ${val.day}/${val.month}/${val.year} $SelectedHour:${val.minute}:${DateTime.now().second} ';
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          const Divider(thickness: 3),
          ...global.allproduct
              .map((e) => Column(
            children: [
              Row(
                children: [
                  Image.network("${e['image']}", height: 80,width: 150,),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${e['name']}",style: const TextStyle(color: Colors.black,),),
                      Text("PR. ${e['price']}",style: const TextStyle(color: Colors.black,),),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          e['bool'] = !e['bool'];
                          if (e['bool'] == true) {
                            global.allproduct.add(e);
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
            ],
          ))
              .toList(),
          (global.allproduct.isEmpty == true)
              ? Container()
              : const Divider(thickness: 3),
          Align(
            alignment: Alignment.bottomRight,
            child: Text("Total ${global.total}",style: const TextStyle(color: Colors.black),),
          )
        ],
      ),
    );
  }
}