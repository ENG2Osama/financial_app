import 'package:flutter/material.dart';

class buttomprimary extends StatelessWidget {
  Function() fun;

  String txt;

  buttomprimary({super.key, required this.txt, required this.fun()});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(context).textTheme.bodyMedium,
        minimumSize: Size(300, 56),
        //    foregroundColor: Colors.black,
      ),
      onPressed: fun,
      child: Text(txt),
    );
    ;
  }
}
