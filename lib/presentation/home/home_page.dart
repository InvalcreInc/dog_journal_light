import 'package:dog_journal_light/application/note/notes/note_bloc.dart';
import 'package:dog_journal_light/presentation/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'add_note_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Заметки'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddNotePage.routeName);
        },
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        //listener: (context, state) {},
        buildWhen: (previous, current) {
          if (previous.notes.length != current.notes.length) {
            return true;
          }

          return false;
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isEmpty) {
            return const Center(
              child: Text('Нет заметок, пожалуйста, добавьте заметки'),
            );
          }

          return ListView.separated(
            itemCount: state.notes.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                minVerticalPadding: 0.0,
                leading: AppImage(
                  height: kToolbarHeight,
                  width: kToolbarHeight,
                  image: note.imagePath,
                ),
                title: Text(note.title),
                subtitle: Text(
                  note.comment,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<NoteBloc>().add(NoteEvent.deleteNote(note));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
