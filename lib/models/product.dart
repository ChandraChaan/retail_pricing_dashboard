class Product {
  String storeId;
  String sku;
  String name;
  double price;
  String date;

  Product({
    required this.storeId,
    required this.sku,
    required this.name,
    required this.price,
    required this.date,
  });

  factory Product.fromCsv(List<dynamic> row) {
    return Product(
      storeId: row[0].toString(),
      sku: row[1].toString(),
      name: row[2].toString(),
      price: double.parse(row[3].toString()),
      date: row[4].toString(),
    );
  }
}