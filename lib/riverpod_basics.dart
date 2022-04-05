import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_providers.dart';

class RiverpodBasics extends StatelessWidget {
  const RiverpodBasics({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Text(ref.watch(titleProvider));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyText(),
            MyCounterText(),
          ],
        ),
      ),
      floatingActionButton:
      const MyFloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterStateProvider);
    return Text(counter.toString(), style: Theme.of(context).textTheme.headline4);
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
       ref.read(counterStateProvider.state).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(textProvider));
  }
}
