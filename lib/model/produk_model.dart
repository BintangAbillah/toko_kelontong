class ProductModel {
  final int? id;
  final String name;
  final int stock;
  final int price;
  final String description;

  ProductModel({
    this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.description,
  });

  // Convert object ke JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "stock": stock,
      "price": price,
      "description": description,
    };
  }

  // Convert JSON ke object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"] ?? "",
      stock: json["stock"] ?? 0,
      price: json["price"] ?? 0,
      description: json["description"] ?? "",
    );
  }
}