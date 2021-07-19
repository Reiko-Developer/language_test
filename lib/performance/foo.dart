import 'package:flutter/material.dart';
import 'package:language_test/performance/custom_box.dart';
import 'package:language_test/performance/custom_column.dart';
import 'package:language_test/performance/custom_expanded.dart';

class Foo extends StatefulWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  _FooState createState() => _FooState();
}

class _FooState extends State<Foo> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomExpanded(
          flex: 2,
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'A definitive guide \nto RenderObjects in flutter',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'by ReikoDev',
            textAlign: TextAlign.center,
          ),
        ),
        const CustomBox(
          flex: 10,
          color: Color(0xAFDF32A4),
        ),
      ],
    );
  }
}
