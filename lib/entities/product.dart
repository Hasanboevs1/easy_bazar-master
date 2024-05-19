class ProductModel {
  final int price;
  final int categoryId;
  final String name;
  final String imageUrl;

  ProductModel({
    required this.categoryId,
    required this.price,
    required this.name,
    required this.imageUrl,
  });
}

