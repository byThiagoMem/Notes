import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = '';
  TextEditingController textController = TextEditingController();
  var isEditing = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments.toString();
        textController.text = description;
        isEditing = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note' : 'Create note'),
        centerTitle: true,
        actions: [
          if (isEditing)
            IconButton(
              onPressed: () {
                Navigator.pop(context, "");
              },
              icon: Icon(
                Icons.delete,
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            SizedBox(height: 32),
            if (description.isNotEmpty)
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, description);
                  },
                  child: Text('Salvar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
