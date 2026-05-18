import 'package:flutter/material.dart';

import 'ui/login_page.dart';
import 'ui/produk_form.dart';
import 'ui/product_detail_page.dart';
import 'ui/produk_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Toko Kelontong',

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      // HALAMAN AWAL
      home: const LoginPage(),

      routes: {

        // LOGIN
        '/login': (context) => const LoginPage(),

        // PRODUCT PAGE
        '/products': (context) => const ProductPage(),

        // PRODUCT FORM
        '/product-form': (context) => const ProductFormPage(),

        // PRODUCT DETAIL
        '/product-detail': (context) => const ProductDetailPage(
              productName: "Beras Premium",
              stock: 20,
              price: 75000,
              description:
                  "Beras premium kualitas terbaik untuk kebutuhan sehari-hari.",
            ),
      },
    );
  }
}