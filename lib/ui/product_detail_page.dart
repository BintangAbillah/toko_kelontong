import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final int stock;
  final int price;
  final String description;

  const ProductDetailPage({
    Key? key,
    required this.productName,
    required this.stock,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              productName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text("Stok : $stock"),

            const SizedBox(height: 10),

            Text("Harga : Rp $price"),

            const SizedBox(height: 20),

            Text(description),
          ],
        ),
      ),
    );
  }
}