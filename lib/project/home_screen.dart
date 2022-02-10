import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'my_carousel_slider.dart';
import 'product_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'homeScreen';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  Widget appBarTitle = const Text("Shopping Kart");
  Icon actionIcon = const Icon(Icons.search);
  String key = '';
  String category = '';
  //
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: appBarTitle,
        actions: [
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(
                () {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = const Icon(Icons.close);
                    appBarTitle = TextField(
                      onChanged: (value) => setState(() => key = value),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white)),
                    );
                  } else {
                    actionIcon = const Icon(Icons.search);
                    appBarTitle = const Text("Shopping Kart");
                  }
                  key = '';
                },
              );
            },
          ),
          IconButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierColor: Colors.black54,
                  barrierDismissible: true,
                  barrierLabel: 'Label',
                  pageBuilder: (_, __, ___) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 85.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 220,
                          width: 180,
                          // color: Colors.blue,
                          child: Material(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Select Category',
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade500,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                ListTile(
                                  onTap: () => setState(() {
                                    category = '';
                                    Navigator.pop(context);
                                  }),
                                  title: const Text(
                                    'All',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                ListTile(
                                  onTap: () => setState(() {
                                    category = 'Premium';
                                    Navigator.pop(context);
                                  }),
                                  title: const Text(
                                    'Premium',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                ListTile(
                                  onTap: () => setState(
                                    () {
                                      category = 'Tamilnadu';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  title: const Text(
                                    'Tamilnadu',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/data/products.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jsondata = json.decode(snapshot.data.toString());
            var data = [];

            ///---Searching-------
            //Key
            var tempList = key.split(',');
            String temp = '';
            for (var t in tempList) {
              temp += t;
            }
            var newKeys = temp.split(' ');
            //
            var datac = [];
            for (var d in jsondata) {
              if (category == '' ||
                  d['p_category'].toLowerCase() == category.toLowerCase()) {
                datac.add(d);
                datac = datac.toSet().toList();
              }
            }

            String completeData = '';
            for (var d in datac) {
              completeData = "${d['p_name']}${d['p_cost']}${d['p_details']}";
              for (var k in newKeys) {
                if (key == '' ||
                    (completeData.toLowerCase().contains(k.toLowerCase()) &&
                        k != '')) {
                  data.add(d);
                  data = data.toSet().toList();
                }
              }
            }

            ///-----------------------
            return ListView.builder(
                itemCount: data.length + 2,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? MyCarouselSlider(w: w)
                      : index == 1
                          ? const SizedBox(height: 10.0)
                          : ProductCard(
                              p_category: data[index - 2]['p_category'].toString(),
                              p_availability:
                                  data[index - 2]['p_availability'].toString(),
                              p_name: data[index - 2]['p_name'],
                              p_details: data[index - 2]['p_details'],
                              p_cost: data[index - 2]['p_cost'].toString(),
                              p_img: data[index - 2]['p_img'],
                            );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

