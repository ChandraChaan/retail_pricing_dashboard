import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import '../models/product.dart';

class CsvService {
  static Future<List<Product>> loadCsv() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );

    if (result == null) return [];

    final file = result.files.first;

    if (file.bytes == null) return [];

    final csvString = utf8.decode(file.bytes!);

    final rows = csv.decode(csvString);

    List<Product> list = [];

    for (int i = 1; i < rows.length; i++) {
      list.add(Product.fromCsv(rows[i]));
    }

    return list;
  }
}