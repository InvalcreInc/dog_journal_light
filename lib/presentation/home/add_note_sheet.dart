import 'package:dog_journal_light/application/note/add_note/add_note_bloc.dart';

import 'package:dog_journal_light/domain/note/note.dart';
import 'package:dog_journal_light/presentation/core/widgets/app_image.dart';
import 'package:dog_journal_light/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:get/route_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  static const routeName = '/add_note';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteBloc, AddNoteState>(
      listenWhen: (state, previous) => !previous.isInitial,
      listener: (context, state) {
        if (state.isLoading) {
          if (!context.loaderOverlay.visible) context.loaderOverlay.show();
          return;
        }
        context.loaderOverlay.hide();

        if (state.isSuccess) {
          Get.back();
          kShowSnackbar(title: 'Успех', message: 'Заметка успешно сохранена');
        }
        if (state.isFailure) {}
        context.read<AddNoteBloc>().add(AddNoteEvent.started());
      },
      child: const _AddNoteView(),
    );
  }
}

class _AddNoteView extends StatefulWidget {
  const _AddNoteView();

  @override
  State<_AddNoteView> createState() => __AddNoteViewState();
}

class __AddNoteViewState extends State<_AddNoteView> {
  late final TextEditingController _textTitleController;
  late final TextEditingController _textCommentController;
  late final GlobalKey<FormBuilderState> _formKey;
  late FocusNode _textTitleFocusNode;
  late FocusNode _textCommentFocusNode;
  XFile? _file;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _textTitleController = TextEditingController();
    _textTitleFocusNode = FocusNode();
    _textCommentController = TextEditingController();
    _textCommentFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _textTitleFocusNode.dispose();
    _textTitleController.dispose();
    _textCommentFocusNode.dispose();
    _textCommentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить заметку')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FormBuilderImagePicker(
                    name: 'photos',
                    decoration: InputDecoration.collapsed(
                      hintText: '',
                    ).copyWith(
                      contentPadding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(
                        Size.square(kToolbarHeight * 1.2),
                      ),
                    ),
                    maxImages: 1,
                    previewHeight: kToolbarHeight,
                    previewWidth: kToolbarHeight,
                    maxWidth: kToolbarHeight,
                    previewMargin: EdgeInsets.zero,
                    placeholderWidget: AppImage(
                      width: kToolbarHeight,
                      height: kToolbarHeight,
                    ),
                    onChanged: (value) {
                      final isNotEmpty = value?.isNotEmpty ?? false;
                      if (isNotEmpty) {
                        _file = value?.first;
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Пожалуйста, заполните все поля',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            const SizedBox(height: 20),
            _textFormField(
              labelText: 'Введите название',
              controller: _textTitleController,
              focusNode: _textTitleFocusNode,
              hintText: 'Название',
            ),
            const SizedBox(height: 20.0),
            _textFormField(
              labelText: 'Введите комментарии',
              controller: _textCommentController,
              focusNode: _textCommentFocusNode,
              hintText: 'Комментарии',
              minLines: 3,
              maxLines: 10,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final comment = _textCommentController.text;
                final title = _textTitleController.text;
                final image = _file?.path;
                if (image == null) {
                  kShowSnackbar(
                    title: 'Изображение не выбрано',
                    message: 'Пожалуйста, выберите изображение',
                  );
                  return;
                }
                if (comment.isEmpty || title.isEmpty) {
                  kShowSnackbar(
                    title: 'Поля не заполнены',
                    message: 'Пожалуйста, заполните все поля',
                  );
                  return;
                }
                final note = Note.empty(
                  title: title,
                  comment: comment,
                  imagePath: image,
                );
                context.read<AddNoteBloc>().add(AddNoteEvent.addNote(note));
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField({
    required String labelText,
    required TextEditingController controller,
    required FocusNode? focusNode,
    int minLines = 1,
    int maxLines = 1,
    // required Function(String?)? onChanged,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    String hintText = '',
    ValueChanged<String?>? onChanged,
  }) {
    return FormBuilderTextField(
      name: labelText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      // autofocus: true,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: _inputDecoration(hintText: hintText, labelText: labelText),

      validator: validator,
      keyboardType: keyboardType,
    );
  }

  InputDecoration _inputDecoration({String? hintText, String? labelText}) {
    return InputDecoration(
      isDense: true,
      hintText: hintText,
      labelText: labelText,
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      border: _inputBorder(),
      focusedBorder: _inputBorder(state: _InputState.focused),
      enabledBorder: _inputBorder(),
      errorBorder: _inputBorder(state: _InputState.error),
    );
  }

  InputBorder _inputBorder({_InputState? state}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color: switch (state) {
          _InputState.error => Colors.red,
          _InputState.focused => Colors.green,
          _ => Colors.grey.shade300,
        },
      ),
    );
  }
}

enum _InputState { focused, error }
