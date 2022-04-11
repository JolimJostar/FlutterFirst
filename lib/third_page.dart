import 'package:flutter/material.dart';
import 'package:flutter_application_1/forth_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDog',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Статичные элементы'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DogName(name: 'Бонья'),
              SizedBox(height: 8.0),
              DogName(name: 'Мася'),
              SizedBox(height: 8.0),
              DogName(name: 'Пася')
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                child: const Text('предыдущая'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            const SizedBox(
              width: 16.00,
            ),
            ElevatedButton(
                child: const Text('след'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForthPage()));
                }),
          ],
        ),
      ),
    );
  }
}

class DogName extends StatelessWidget {
  const DogName({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.lightBlueAccent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name),
      ),
    );
  }
}
