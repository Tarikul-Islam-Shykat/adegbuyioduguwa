import 'dart:ui';

class Product {
  final String id;
  final String name;
  final List<String> images;
  final double price;
  final String category;
  final ProductTag? tag;

  Product({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.category,
    this.tag,
  });

  // Convert from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      price: json['price'].toDouble(),
      category: json['category'],
      tag: json['tag'] != null ? ProductTag.fromString(json['tag']) : null,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'price': price,
      'category': category,
      'tag': tag?.name,
    };
  }
}

enum ProductTag {
  topSelling,
  superDeal,
  stockOut,
  flashSale,
  discount;

  static ProductTag fromString(String tag) {
    switch (tag.toLowerCase()) {
      case 'top selling':
        return ProductTag.topSelling;
      case 'super deal':
        return ProductTag.superDeal;
      case 'stock out':
        return ProductTag.stockOut;
      case 'flash sale':
        return ProductTag.flashSale;
      case 'discount':
        return ProductTag.discount;
      default:
        return ProductTag.topSelling;
    }
  }

  String get displayName {
    switch (this) {
      case ProductTag.topSelling:
        return 'Top selling';
      case ProductTag.superDeal:
        return 'Super deal';
      case ProductTag.stockOut:
        return 'Stock out';
      case ProductTag.flashSale:
        return 'Flash sale';
      case ProductTag.discount:
        return 'Discount';
    }
  }

  Color get color {
    switch (this) {
      case ProductTag.topSelling:
        return const Color(0xFFFF9500);
      case ProductTag.superDeal:
        return const Color(0xFF34C759);
      case ProductTag.stockOut:
        return const Color(0xFFFF3B30);
      case ProductTag.flashSale:
        return const Color(0xFFFF2D92);
      case ProductTag.discount:
        return const Color(0xFF5856D6);
    }
  }
}
