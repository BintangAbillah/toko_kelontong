import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {

    final products = [
      {
        "name": "Beras Premium",
        "stock": 20,
        "price": 75000,
        "description": "Beras terbaik"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk"),
      ),

      body: ListView.builder(
        itemCount: products.length,

        itemBuilder: (context, index) {

          final product = products[index];

          return ListTile(
            title: Text(product["name"].toString()),

            subtitle: Text(
              "Rp ${product["price"]}",
            ),

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(
                    productName: product["name"].toString(),
                    stock: product["stock"] as int,
                    price: product["price"] as int,
                    description:
                        product["description"].toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}