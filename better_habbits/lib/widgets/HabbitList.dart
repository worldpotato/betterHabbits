import 'dart:math';

import 'package:flutter/material.dart';
import 'package:better_habbits/models/habbit.dart';
import 'package:better_habbits/utils/databaseHelper.dart';

class HabbitList extends StatefulWidget {
  final name = "Better Habbits";

  @override
  State<StatefulWidget> createState() => HabbitListState();
}

class HabbitListState extends State<HabbitList> {

  List<Habbit> habbits = null;

  _readHabbits() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    habbits = await helper.queryAllHabbits();
  }

  @override
  Widget build(BuildContext context) {
    _readHabbits();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView.builder(
        itemCount: habbits.length,
        itemBuilder: (BuildContext ctxt, int index) =>
            HabbitPreviewBuilder().build(habbits[index]),
      ),
    );
  }
}

class HabbitPreviewBuilder {
  num maxHeight = 150.0;

  Widget build(Habbit hab) {
    return LimitedBox(
      maxHeight: maxHeight,
      child: Container(
        height: 100,
        child: Text(hab.name),
        color: Color.fromARGB(
            Random.secure().nextInt(255),
            Random.secure().nextInt(255),
            Random.secure().nextInt(255),
            Random.secure().nextInt(255)),
      ),
    );
  }
}
