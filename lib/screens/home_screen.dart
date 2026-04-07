import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/csv_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  String searchText = '';
  bool isAscending = true;
  @override
  Widget build(BuildContext context) {
    List<Product> filtered = products.where((p) {
      return p.name.toLowerCase().contains(searchText.toLowerCase()) ||
          p.sku.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    filtered.sort((a, b) {
      return isAscending
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Retail Pricing'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              List<Product> data = await CsvService.loadCsv();
              setState(() {
                products = data;
              });
            },
            child: Text('Upload CSV'),
          ),

          TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isAscending = !isAscending;
              });
            },
            child: Text('Sort by Price'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final p = filtered[index];

                  return ListTile(
                    title: Text(p.name),
                    subtitle: Text(p.sku),
                    trailing: Text(p.price.toString()),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController controller =
                          TextEditingController(text: p.price.toString());

                          return AlertDialog(
                            title: Text('Edit Price'),
                            content: TextField(
                              controller: controller,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    p.price = double.tryParse(controller.text) ?? p.price;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}