// ignore_for_file: file_names

import 'dart:developer';

class Product {
  final String name;
  final double price;
  final double rating;

  Product(this.name, this.price, this.rating);
}

void main() {
  List<Product> products = [
    Product("Product A", 10.00, 4.2),
    Product("Product B", 20.00, 3.8),
    Product("Product z", 5.00, 4.7),
    Product("Product D", 15.00, 4.5),
  ];
  List<Product> sortByPrice(List<Product> products) {
    return products..sort((a, b) => a.price.compareTo(b.price));
  }

  List<Product> sortByName(List<Product> products) {
    return products..sort((a, b) => a.name.compareTo(b.name));
  }

  List<Product> sortByRating(List<Product> products) {
    return products..sort((a, b) => b.rating.compareTo(a.rating));
  }

  // Function tear-offs for sorting
  var sortFunction = sortByPrice; // Default sorting

  // User selects "Sort by Name"
  // sortFunction = sortByName;

  // User selects "Sort by Rating"
  // sortFunction = sortByRating;

  List<Product> sortedProducts = sortFunction(products);

  // Now you can process the sorted products
  for (var product in sortedProducts) {
    log("${product.name} ${product.price}");
  }
}
