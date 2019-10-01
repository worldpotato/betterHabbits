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
  void createSampleDataInDatabase() {
    print("Create sample habbits");

    Habbit habbit1 = Habbit(name: "habbit1", category: "test");
    Habbit habbit2 = Habbit(name: "habbit2", category: "test");
    Habbit habbit3 = Habbit(name: "habbit3", category: "test");

    DatabaseHelper helper = DatabaseHelper.instance;
    helper.insert(habbit1);
    helper.insert(habbit2);
    helper.insert(habbit3);
  }

  List<Habbit> habbits = null;

  Future _readHabbits() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    helper.queryAllHabbits().then((List<Habbit> temp_habbits) {
      if (habbits == null) {
        setState(() {
          habbits = temp_habbits;
        });
      }
    });
  }

//  }

  @override
  Widget build(BuildContext context) {
    _readHabbits();
    if (habbits == null)
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
          ),
          body: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              key: Key("ProgressIndicator"),
            ),
          ));
    else {
      if(habbits.length == 0) {
        createSampleDataInDatabase();
      }
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
