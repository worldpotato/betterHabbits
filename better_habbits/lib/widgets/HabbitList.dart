import 'dart:math';

import 'package:flutter/material.dart';

class HabbitList extends StatefulWidget {
  final name = "Better Habbits";

  @override
  State<StatefulWidget> createState() => HabbitListState();

}

class HabbitListState extends State<HabbitList>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView(
        children: <Widget>[
          LimitedBox(
            maxHeight: 200,
            child: Container(
              color: Color.fromARGB(Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)),
            ),
          ),
          LimitedBox(
            maxHeight: 200,
            child: Container(
              color: Color.fromARGB(Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)),
            ),
          ),
          LimitedBox(
            maxHeight: 200,
            child: Container(
              color: Color.fromARGB(Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)),
            ),
          ),
          LimitedBox(
            maxHeight: 200,
            child: Container(
              color: Color.fromARGB(Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)),
            ),
          ),
        ],
      ),
    );
  }
}
