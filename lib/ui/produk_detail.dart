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
      backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: const Text("Detail Produk"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Card(
          elevation: 5,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: Container(
                    width: 120,
                    height: 120,

                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Icon(
                      Icons.shopping_bag,
                      size: 70,
                      color: Colors.green,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // NAMA PRODUK
                const Text(
                  "Nama Produk",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // STOK
                Row(
                  children: [

                    const Icon(
                      Icons.inventory,
                      color: Colors.green,
                    ),

                    const SizedBox(width: 10),

                    Text(
                      "Stok : $stock",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // HARGA
                Row(
                  children: [

                    const Icon(
                      Icons.attach_money,
                      color: Colors.orange,
                    ),

                    const SizedBox(width: 10),

                    Text(
                      "Harga : Rp $price",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // DESKRIPSI
                const Text(
                  "Deskripsi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Produk ditambahkan ke keranjang"),
                        ),
                      );
                    },

                    icon: const Icon(Icons.shopping_cart),

                    label: const Text(
                      "Tambah ke Keranjang",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}