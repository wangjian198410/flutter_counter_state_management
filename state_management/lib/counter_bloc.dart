import 'package:bloc/bloc.dart';
import 'package:statemanagement/counter_event.dart';
import 'package:statemanagement/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    print("map event to state: $event ${event is IncrementEvent}");
    if (event is IncrementEvent) {
      print("state: ${state.counter}");
      yield CounterState(counter: state.counter + 1);
    } else if (event is DecrementEvent) {
      print("state: ${state.counter}");
      yield CounterState(counter: state.counter - 1);
    }
  }
}
