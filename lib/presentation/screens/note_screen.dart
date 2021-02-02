import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:server_notes/logic/cubit/note/note_cubit.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _titleController =
        BlocProvider.of<NoteCubit>(context).titleTextEditingController;

    final _dataController =
        BlocProvider.of<NoteCubit>(context).dataTextEditingController;

    _onPressedBack() async {
      await BlocProvider.of<NoteCubit>(context).changeNote(context);
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(8.0),
          child: Icon(CupertinoIcons.left_chevron),
          onPressed: () => _onPressedBack(),
        ),
        middle: Text('Note'),
      ),
      child: ListView(
        children: [
          BlocBuilder(
            cubit: BlocProvider.of<NoteCubit>(context),
            builder: (_, state) {
              return CupertinoTextField(
                controller: _titleController,
                decoration: BlocProvider.of<NoteCubit>(context).state.error
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFFF2222),
                          ),
                        ),
                      )
                    : null,
                placeholder: 'title',
              );
            },
          ),
          CupertinoTextField(
            controller: _dataController,
            placeholder: 'text',
            maxLines: 124,
          )
        ],
      ),
    );
  }
}
