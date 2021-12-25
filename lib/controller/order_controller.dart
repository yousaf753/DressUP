import 'package:dress_up/model/cart_item.dart';
import 'package:dress_up/model/order.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
class OrderController extends GetxController {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }
  int get itemCount {
    return _orders.length;
  }
  void addOrder(List<Item> item, double amount, int count, Position position) {
    _orders.add(Order(
        products: item,
        id: DateTime.now().toString(),
        dateTime: DateTime.now(),
        amount: amount,
        itemCount: count,
        position: position));
    update();
  }
}
