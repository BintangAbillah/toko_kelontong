import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registrasi berhasil"),
        ),
      );

      // Tambahkan proses register/database di sini
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: const Text("Registrasi"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: SingleChildScrollView(
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
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Icon(
                      Icons.store,
                      size: 80,
                      color: Colors.green,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Daftar Akun",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Nama
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Nama",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Email
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }

                        if (!value.contains("@")) {
                          return "Format email tidak valid";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: isPasswordHidden,

                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),

                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        }

                        if (value.length < 6) {
                          return "Password minimal 6 karakter";
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

                        onPressed: register,

                        child: const Text(
                          "DAFTAR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        "Sudah punya akun? Login",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}