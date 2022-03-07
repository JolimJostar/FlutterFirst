import 'package:flutter/material.dart';

class FithPage extends StatelessWidget {
  const FithPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'statefull widgets',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget'),
        ),
        body: const Center(
          child: InheritedNose(
            nose: 'Счётчик',
            child: ItemCount(
              name: 'Count'
            )
          )
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
                      builder: (context) => const FithPage()));
                }),
          ],
        ),
      ),
    );
  }
}

class InheritedNose extends InheritedWidget {
  final String nose;

  const InheritedNose({required this.nose, required Widget child, Key? key})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedNose? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedNose>();
  }
}

class ItemCount extends StatefulWidget {
  const ItemCount({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCount>
    with SingleTickerProviderStateMixin {
  late double _scale;
  int count = 0;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nose = InheritedNose.of(context)?.nose;
    _scale = 1 - _animationController.value;
    return Listener(
        onPointerDown: (PointerDownEvent event) {
          setState(() {
            count++;
          });
          _animationController.forward();
        },
        onPointerUp: (PointerUpEvent event) {
          _animationController.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: DecoratedBox(
              decoration:
                  BoxDecoration(color: Colors.lightBlueAccent, boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(4, 4),
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$nose: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 60,
                            color: Colors.white)),
                    Text(
                      '$count',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Colors.white70),
                    )
                  ],
                ),
              )),
        ));
  }
}
