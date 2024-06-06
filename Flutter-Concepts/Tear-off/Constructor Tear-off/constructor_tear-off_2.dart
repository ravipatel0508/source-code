// ignore_for_file: file_names

import 'dart:developer';

import 'package:uuid/uuid.dart';

class Order {
  final String id;
  final String customerId;
  final List<OrderItem> items;
  final DateTime createdAt;

  // Regular constructor (might be used internally)
  Order(this.id, this.customerId, this.items, this.createdAt);

  // Constructor tear-off (for creating new orders)
  static Order Function(String customerId, List<OrderItem> items) newOrder =
      (customerId, items) => Order(
            // Generate unique ID (replace with your actual logic)
            const Uuid().v4(),
            customerId,
            items,
            DateTime.now(),
          );

  // Factory constructor for deserialization (e.g., from JSON)
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['id'] as String,
      json['customerId'] as String,
      (json['items'] as List)
          .map((itemJson) => OrderItem.fromJson(itemJson))
          .toList(),
      DateTime.parse(json['createdAt'] as String),
    );
  }
}

class OrderItem {
  final String productId;
  final int quantity;

  // Simple constructor
  OrderItem(this.productId, this.quantity);

  // Factory constructor for deserialization (e.g., from JSON)
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(json['productId'] as String, json['quantity'] as int);
  }
}

// Usage example (assuming Uuid class for generating unique IDs)
void main() {
  // Create a new order using constructor tear-off
  var createOrder = Order.newOrder;
  List<OrderItem> orderItems = [
    OrderItem("product_1", 2),
    OrderItem("product_2", 1),
  ];
  Order newOrder = createOrder("customer_id_123", orderItems);

  // Access order details
  log("Order ID: ${newOrder.id}");
  log("Customer ID: ${newOrder.customerId}");
}
