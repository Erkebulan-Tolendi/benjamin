import 'dart:convert';

import 'package:benjamin/features/material_select_page/data/materials_type.dart';
import 'package:benjamin/features/material_select_page/ui/cart_page.dart';
import 'package:benjamin/features/material_select_page/ui/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialSelectPage extends StatefulWidget {
  final String phoneNum;
  final String userName;
  final String name;
  final String description;
  final int price;
  final String image;

  const MaterialSelectPage(
      {Key? key,
      required this.phoneNum,
      required this.userName,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  State<MaterialSelectPage> createState() => _MaterialSelectPageState();
}

class _MaterialSelectPageState extends State<MaterialSelectPage> {
  late List<MaterialsType> materialsType;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      String jsonDataString =
          await rootBundle.loadString('assets/materials_data.json');
      List<dynamic> jsonData = jsonDecode(jsonDataString);
      setState(() {
        materialsType =
            jsonData.map((item) => MaterialsType.fromJson(item)).toList();
      });
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(
                            name: widget.name,
                            price: widget.price,
                            image: widget.image,
                            phoneNum: widget.phoneNum,
                            userName: widget.userName,
                            description: widget.description,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
        title: const Text("Material Selecting Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/${widget.image}',
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/${widget.image}',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(widget.name),
            subtitle: Text(widget.description),
            trailing: Text(
              '${widget.price} kzt',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: materialsType.length,
              itemBuilder: (context, index) {
                final materialType = materialsType[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            materialsType: materialType,
                            ctx: context,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/materials/${materialType.img}',
                              width: 80,
                              height: 83,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  materialType.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '${materialType.price} kzt/m',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
