import 'package:flutter/widgets.dart';
import 'package:statemanagement/counter_bloc.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc cartBloc;

  CounterProvider({
    Key key,
    CounterBloc cartBloc,
    Widget child,
  })  : cartBloc = cartBloc ?? CounterBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CounterBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>().cartBloc;
}
