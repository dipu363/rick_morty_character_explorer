import 'package:flutter/material.dart';
import 'package:rick_morty_character_explorer/features/characters/data/datasource/character_remote_ds.dart';

import 'core/network/api_service.dart';
import 'core/storage/hive_service.dart';
import 'features/characters/data/datasource/character_local_ds.dart';
import 'features/characters/data/repository/character_repository.dart';


Future<void> testRepository() async {

  final remote =
  CharacterRemoteDataSource(
      apiService: ApiService());

  final local =
  CharacterLocalDataSource();

  final repository =
  CharacterRepository(
      remote: remote,
      local: local);

  final characters =
  await repository.fetchCharacters(1);

  print(
      "Repository Characters: ${characters.length}");
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await testRepository();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('Go next:'),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
