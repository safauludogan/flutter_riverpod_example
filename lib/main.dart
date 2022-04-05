import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod_basics.dart';
import 'package:flutter_riverpod_example/state_notifier_usage.dart';

void main() {
  runApp(const ProviderScope(
    child: StateNotifierUsage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyText(),
            MyCounterText(counter: _counter),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(onIncrease: () {
        setState(() {
          _counter++;
        });
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCounterText extends StatelessWidget {
  final int counter;

  const MyCounterText({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$counter', style: Theme.of(context).textTheme.headline4);
  }
}

class MyFloatingActionButton extends StatelessWidget {
  VoidCallback onIncrease;

  MyFloatingActionButton({Key? key, required this.onIncrease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onIncrease();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}
