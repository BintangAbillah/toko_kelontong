import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> saveProduct() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Produk berhasil disimpan"),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: const Text("Form Produk"),
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

            child: Form(
              key: _formKey,

              child: Column(
                children: [

                  const Icon(
                    Icons.shopping_bag,
                    size: 80,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 20),

                  // NAMA PRODUK
                  TextFormField(
                    controller: nameController,

                    decoration: InputDecoration(
                      labelText: "Nama Produk",
                      prefixIcon: const Icon(Icons.inventory),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama produk tidak boleh kosong";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // STOK
                  TextFormField(
                    controller: stockController,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: "Stok",
                      prefixIcon: const Icon(Icons.numbers),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Stok tidak boleh kosong";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // HARGA
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: "Harga",
                      prefixIcon: const Icon(Icons.attach_money),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: isLoading ? null : saveProduct,

                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "SIMPAN PRODUK",
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
      ),
    );
  }
}