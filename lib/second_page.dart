import 'package:flutter/material.dart';
import 'package:flutter_application_1/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(
      children: [
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                kitten.name,
                style: localTheme.textTheme.displayMedium,
              ),
              Text(
                kitten.desc,
                style: localTheme.textTheme.headline4,
              ),
              const SizedBox(height: 32.0),
              Text(
                '${kitten.age} years old',
                style: localTheme.textTheme.headline5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close')),
                    ElevatedButton(onPressed: () {}, child: const Text('Adopt'))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme.of(context).textTheme.headline3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('видос 2')),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
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
                      builder: (context) => const ThirdPage()));
              }),
        ],
      ),
    );
  }
}

class Kitten {
  const Kitten(
      {required this.name,
      required this.desc,
      required this.age,
      required this.imageUrl});

  final String name;
  final String desc;
  final int age;
  final String imageUrl;
}

final List<Kitten> _kittens = <Kitten>[
  const Kitten(
      name: 'Click Me',
      desc: 'Most beatifull cat',
      age: 420,
      imageUrl: 'https://i.ibb.co/z4TcCLq/obj-08-malahit-neut.png')
];
