import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  List<Services> cart = [];
  double totalCartValue = 0;

  int get total => cart.length;

  void addServicest(services) {
    int index = cart.indexWhere((i) => i.id == services.id);
    print(index);
    if (index != -1)
      updateServices(services, services.qty + 1);
    else {
      cart.add(services);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeServices(services) {
    int index = cart.indexWhere((i) => i.id == services.id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == services.id);
    calculateTotal();
    notifyListeners();
  }

  void updateServices(services, qty) {
    int index = cart.indexWhere((i) => i.id == services.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0) removeServices(services);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price * f.qty;
    });
  }
}

class Services {
  int id;
  String title;
  double price;
  int qty;

  Services(
      {required this.id,
      required this.title,
      required this.price,
      required this.qty});
}
