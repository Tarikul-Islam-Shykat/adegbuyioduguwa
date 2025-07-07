import 'package:get/get.dart';
import 'package:prettyrini/feature/user_flow/products/model/product_model.dart';

class ProductController extends GetxController {
  // Observable variables
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var searchText = ''.obs;
  var selectedCategory = 'All'.obs;
  var isLoading = false.obs;

  // Categories
  List<String> categories = ['All', 'Jackets', 'Jeans', 'Shoes', 'Accessories'];

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  // Load dummy products
  void loadProducts() {
    isLoading.value = true;

    // Simulate API call delay
    Future.delayed(Duration(milliseconds: 500), () {
      products.value = [
        Product(
          id: '1',
          name: 'Bomber Jackets',
          images: [
            'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=300&h=300&fit=crop',
            'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=300&h=300&fit=crop',
          ],
          price: 49.99,
          category: 'Jackets',
          tag: ProductTag.topSelling,
        ),
        Product(
          id: '2',
          name: 'Air Conditioner',
          images: [
            'https://images.unsplash.com/photo-1631545804203-b4c4c56c5d1d?w=300&h=300&fit=crop',
          ],
          price: 49.99,
          category: 'Accessories',
          tag: ProductTag.superDeal,
        ),
        Product(
          id: '3',
          name: 'Denim Jeans',
          images: [
            'https://images.unsplash.com/photo-1542272604-787c3835535d?w=300&h=300&fit=crop',
          ],
          price: 79.99,
          category: 'Jeans',
          tag: ProductTag.discount,
        ),
        Product(
          id: '4',
          name: 'Running Shoes',
          images: [
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=300&h=300&fit=crop',
          ],
          price: 129.99,
          category: 'Shoes',
          tag: ProductTag.flashSale,
        ),
        Product(
          id: '5',
          name: 'Leather Jacket',
          images: [
            'https://images.unsplash.com/photo-1520975954732-35dd22299614?w=300&h=300&fit=crop',
          ],
          price: 199.99,
          category: 'Jackets',
          tag: ProductTag.stockOut,
        ),
        Product(
          id: '6',
          name: 'Casual Sneakers',
          images: [
            'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=300&h=300&fit=crop',
          ],
          price: 89.99,
          category: 'Shoes',
        ),
        Product(
          id: '7',
          name: 'Slim Fit Jeans',
          images: [
            'https://images.unsplash.com/photo-1475178626620-a4d074967452?w=300&h=300&fit=crop',
          ],
          price: 59.99,
          category: 'Jeans',
          tag: ProductTag.topSelling,
        ),
        Product(
          id: '8',
          name: 'Winter Coat',
          images: [
            'https://images.unsplash.com/photo-1544966503-7cc5ac882d5d?w=300&h=300&fit=crop',
          ],
          price: 149.99,
          category: 'Jackets',
          tag: ProductTag.superDeal,
        ),
      ];

      filteredProducts.value = products;
      isLoading.value = false;
    });
  }

  // Search functionality
  void searchProducts(String query) {
    searchText.value = query;
    filterProducts();
  }

  // Filter by category
  void filterByCategory(String category) {
    selectedCategory.value = category;
    filterProducts();
  }

  // Combined filter function
  void filterProducts() {
    var filtered = products.where((product) {
      bool matchesSearch = searchText.value.isEmpty ||
          product.name.toLowerCase().contains(searchText.value.toLowerCase());

      bool matchesCategory = selectedCategory.value == 'All' ||
          product.category == selectedCategory.value;

      return matchesSearch && matchesCategory;
    }).toList();

    filteredProducts.value = filtered;
  }

  // Get products by tag
  List<Product> getProductsByTag(ProductTag tag) {
    return products.where((product) => product.tag == tag).toList();
  }

  // Clear search
  void clearSearch() {
    searchText.value = '';
    filterProducts();
  }

  // Refresh products
  void refreshProducts() {
    loadProducts();
  }
}
