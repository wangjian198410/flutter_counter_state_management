import 'package:statemanagement/counter_actions.dart';
import 'package:statemanagement/counter_state.dart';

CounterState reducer(CounterState prev, dynamic action) {
  if (action == MyActions.Increment) {
    return new CounterState(prev.counter + 1);
  } else if (action == MyActions.Decrement) {
    return new CounterState(prev.counter - 1);
  } else {
    return prev;
  }
}
