import 'package:flutter/widgets.dart';

import 'package:statemanagement/CounterModel.dart';

class CounterStateContainer extends InheritedWidget {
  final CounterModel counterModel;

  CounterStateContainer(
      {Key key, @required Widget child, @required this.counterModel})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(CounterStateContainer oldWidget) {
    return counterModel.counter.value != oldWidget.counterModel.counter.value;
  }

  static CounterModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterStateContainer>()
        .counterModel;
  }
}
