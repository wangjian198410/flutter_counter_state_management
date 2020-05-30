import 'package:flutter/foundation.dart';

class CounterModel with ChangeNotifier {
  int value = 0;
  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}
