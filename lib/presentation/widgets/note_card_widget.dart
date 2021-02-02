import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:server_notes/data/models/note_model.dart';

class NoteCard extends StatelessWidget {
  NoteCard(
    this.note, {
    this.onTap,
    this.onDismissed,
  });

  final Note note;
  final Function() onTap;
  final Function(DismissDirection) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: Key(note.id),
          onDismissed: onDismissed,
          child: CupertinoButton(
            child: Text(
              note.title,
            ),
            onPressed: onTap,
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          indent: 24.0,
          endIndent: 24.0,
        ),
      ],
    );
  }
}
