import 'package:benjamin/features/material_select_page/data/materials_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/provider/provider_hive.dart';

class InfoPage extends StatefulWidget {
  final MaterialsType materialsType;
  final BuildContext ctx;

  InfoPage({
    Key? key,
    required this.materialsType,
    required this.ctx,
  }) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var total_price_m;

  @override
  void initState() {
    total_price_m = widget.materialsType.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerHive = Provider.of<ProviderHive>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.materialsType.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                "assets/images/materials/${widget.materialsType.img}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Описания : ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.materialsType.desc,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Цена :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${widget.materialsType.price}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Метр',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          total_price_m = widget.materialsType.price;
                          double? parsedValue = double.tryParse(value);
                          if (parsedValue != null) {
                            total_price_m = parsedValue;
                          } else {
                            total_price_m = widget.materialsType.price;
                          }
                          total_price_m *= widget.materialsType.price;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Итоговая цена : ${total_price_m}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      providerHive.createItem(
                        {
                          "name": widget.materialsType.name,
                          "img": widget.materialsType.img,
                          "desc": widget.materialsType.desc,
                          "price": widget.materialsType.price,
                          "total_price": total_price_m,
                        },
                      );
                      Navigator.of(widget.ctx).pop();
                    },
                    child: const Text('Add to cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
