import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../material_select_page/ui/material_select_page.dart';
import '../data/models/furnuture_type.dart';

class TypeSelectPage extends StatefulWidget {
  final String phoneNum;
  final String userName;

  const TypeSelectPage({
    Key? key,
    required this.phoneNum,
    required this.userName,
  }) : super(key: key);

  @override
  State<TypeSelectPage> createState() => _MaterialSelectPageState();
}

class _MaterialSelectPageState extends State<TypeSelectPage> {
  late final List<FurnitureType> furnitureTypes;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      String jsonDataString = await rootBundle.loadString('assets/data.json');
      List<dynamic> jsonData = jsonDecode(jsonDataString);
      setState(() {
        furnitureTypes =
            jsonData.map((item) => FurnitureType.fromJson(item)).toList();
      });
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Type Selecting Page'),
      ),
      body: furnitureTypes == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone Number:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.phoneNum,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'User Name:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.userName,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: furnitureTypes.length,
                    itemBuilder: (context, index) {
                      final furnitureType = furnitureTypes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/${furnitureType.previewImage}',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                furnitureType.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: furnitureTypes[currentIndex].furnitures.length,
                    itemBuilder: (context, index) {
                      final furniture =
                          furnitureTypes[currentIndex].furnitures[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MaterialSelectPage(
                                          phoneNum: widget.phoneNum,
                                          userName: widget.userName,
                                          name: furniture.name,
                                          description: furniture.description,
                                          price: furniture.price,
                                          image: furniture.image,
                                        )));
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/${furniture.image}',
                                      height: 112,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        furniture.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        furniture.description,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      Text(
                                        '${furniture.price} kzt',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
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
