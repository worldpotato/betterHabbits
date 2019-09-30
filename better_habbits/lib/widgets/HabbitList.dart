import 'dart:math';

import 'package:flutter/material.dart';

class HabbitList extends StatefulWidget {
  final name = "Better Habbits";

  @override
  State<StatefulWidget> createState() => HabbitListState();
}

class HabbitListState extends State<HabbitList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext ctxt, int index) =>
            HabbitPreviewBuilder().build(),
      ),
    );
  }
}

class HabbitPreviewBuilder {
  num maxHeight = 150.0;

  Widget build() {
    return LimitedBox(
      maxHeight: maxHeight,
      child: Container(
        color: Color.fromARGB(
            Random.secure().nextInt(255),
            Random.secure().nextInt(255),
            Random.secure().nextInt(255),
            Random.secure().nextInt(255)),
      ),
    );
  }
}
