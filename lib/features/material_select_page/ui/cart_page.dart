import 'package:benjamin/features/material_select_page/data/provider/provider_hive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final String phoneNum;
  final String userName;
  final String name;
  final String description;
  final int price;
  final String image;

  const CartPage(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.phoneNum,
      required this.userName,
      required this.description});

  @override
  State<CartPage> createState() => _CartPageState();
}

var totalPrice;

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final providerHive = Provider.of<ProviderHive>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Stack(
        children: [
          Column(
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
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<ProviderHive>(builder: (context, data, child) {
                  return ListBuilder(data, providerHive, context);
                }),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Text(
                'Total price ${calculateTotalPrice(providerHive.items, widget.price)} kzt',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  int calculateTotalPrice(List<Map<String, dynamic>> items, int sofaPrice) {
    totalPrice = sofaPrice;
    for (var item in items) {
      if (item['total_price'] != null) {
        totalPrice += (item['total_price'] as num).toInt();
      }
    }
    return totalPrice;
  }

  Widget ListBuilder(
    data,
    providerHive,
    context,
  ) {
    return ListView.builder(
      itemCount: data.items.length,
      itemBuilder: (_, index) {
        final currentItem = data.items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/materials/${currentItem["img"]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentItem["name"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        currentItem["desc"],
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '${currentItem["price"].toString()} kzt/m',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      Row(
                        children: [
                          Text(
                            '${currentItem["total_price"].toString()} kzt/m',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${(currentItem["total_price"] / currentItem["price"]).toString()} m',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.blue),
                    ),
                    SizedBox(height: 8.0),
                    IconButton(
                      onPressed: () {
                        providerHive.deleteItem(currentItem["key"]);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
