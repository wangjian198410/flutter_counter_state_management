import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './counterModel.dart';

void main() {
  runApp(MyApp(
    model: CounterModel(),
  ));
}

class MyApp extends StatelessWidget {
  final CounterModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // At the top level of our app, we'll, create a ScopedModel Widget. This
    // will provide the CounterModel to all children in the app that request it
    // using a ScopedModelDescendant.
    return ScopedModel<CounterModel>(
      model: model,
      child: MaterialApp(
        title: 'Scoped Model Demo',
        home: CounterHome('Scoped Model Demo'),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  final String title;

  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            // Create a ScopedModelDescendant. This widget will get the
            // CounterModel from the nearest parent ScopedModel<CounterModel>.
            // It will hand that CounterModel to our builder method, and
            // rebuild any time the CounterModel changes (i.e. after we
            // `notifyListeners` in the Model).
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return Text(
                  model.counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      // Use the ScopedModelDescendant again in order to use the increment
      // method from the CounterModel
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
