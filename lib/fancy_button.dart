// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  const FancyButton({Key? key, required this.onPressed}) : super(key: key);

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'Press or some shit, idk',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
      shape: const StadiumBorder(),
    );
  }
}
