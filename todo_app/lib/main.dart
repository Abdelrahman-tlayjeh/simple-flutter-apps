import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/list_screen.dart';
import '../providers/tasks_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("tasksBox");
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TasksProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To-Do App",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainScreen(),
    );
  }
}
