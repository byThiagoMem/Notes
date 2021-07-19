import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro Item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomCard(
              notes: notes,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var description = await Navigator.pushNamed(context, '/create_note');
          if (description != null) {
            notes.add(description.toString());
            setState(() {});
          }
        },
      ),
    );
  }
}
