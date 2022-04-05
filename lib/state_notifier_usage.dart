import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_providers.dart';

class StateNotifierUsage extends StatelessWidget {
  const StateNotifierUsage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Text(ref.watch(titleProvider2));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyText(),
            MyCounterText(),
            IsCoupleWidget(),
          ],
        ),
      ),
      floatingActionButton:
          const MyFloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class IsCoupleWidget extends ConsumerWidget {
  const IsCoupleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isCouple = ref.watch(isCoupleProvider);
    return Text(isCouple ? 'Çift' : 'Tek');
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterNotifierProvider);
    return Text(counter.toString(),
        style: Theme.of(context).textTheme.headline4);
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        //ref.read(counterNotifierProvider) bize CounterModel'i verir
        //Arttırma ve azaltme metotları CounterModel sınıfında olduğu için
        //Bu sınıfı erişmek için .notifier kullanılır
        ref.read(counterNotifierProvider.notifier).increase();
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
