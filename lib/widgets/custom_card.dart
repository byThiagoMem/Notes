import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  List<String> notes = [];
  CustomCard({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < widget.notes.length; i++)
          Dismissible(
            onDismissed: (DismissDirection direction) {
              widget.notes.removeAt(i);
              setState(() {});
            },
            key: ValueKey<int>(i),
            direction: DismissDirection.endToStart,
            background: Card(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              color: Colors.pink[50],
              child: ListTile(
                title: Text(
                  widget.notes[i],
                ),
                onTap: () async {
                  var response = await Navigator.pushNamed(
                      context, '/create_note',
                      arguments: widget.notes[i]);
                  if (response != null) {
                    var description = response as String;
                    if (response.isEmpty) {
                      widget.notes.removeAt(i);
                    } else {
                      widget.notes[i] = (description.toString());
                    }
                    setState(() {});
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}
