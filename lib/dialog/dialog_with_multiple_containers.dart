import 'package:flutter/material.dart';

///Brute force method.
class DialogWithMultipleContainers extends StatelessWidget {
  const DialogWithMultipleContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
        ),
        Container(
          width: 180,
          height: 450,
          color: Colors.yellow,
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
        ),
        Container(
          width: 250,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.8)),
              BoxShadow(
                blurRadius: 10,
                spreadRadius: -10,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
