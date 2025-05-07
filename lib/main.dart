import 'package:dog_journal_light/application/note/add_note/add_note_bloc.dart';
import 'package:dog_journal_light/application/note/notes/note_bloc.dart';
import 'package:dog_journal_light/presentation/home/add_note_sheet.dart';
import 'package:dog_journal_light/presentation/home/home_page.dart';
import 'package:dog_journal_light/repo/note/note_repo.dart';
import 'package:dog_journal_light/src/app_oberver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final noteApi = LocalStorageApi(await SharedPreferences.getInstance());
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(createNotesRepo: () => noteApi));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.createNotesRepo});
  final LocalStorageApi Function() createNotesRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<LocalStorageApi>(
      create: (_) => createNotesRepo(),
      dispose: (repo) => repo.dispose(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    NoteBloc(context.read<LocalStorageApi>())
                      ..add(NoteEvent.loadNotes()),
          ),
          BlocProvider(
            create: (context) => AddNoteBloc(context.read<LocalStorageApi>()),
          ),
        ],
        child: GlobalLoaderOverlay(
          overlayWidgetBuilder: (_) {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.green,
                secondRingColor: Colors.orangeAccent.shade700,
                thirdRingColor: Colors.yellow.shade700,
                size: 50.0,
              ),
            );
          },
          child: GetMaterialApp(
            title: 'Dog Journal',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
            initialRoute: HomePage.routeName,
            getPages: [
              GetPage(name: HomePage.routeName, page: () => const HomePage()),
              GetPage(
                name: AddNotePage.routeName,
                page: () => const AddNotePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
