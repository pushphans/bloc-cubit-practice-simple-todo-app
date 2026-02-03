import 'package:bloc_cubit_practice_simple_todo_app/features/home/presentation/screens/home_page.dart';
import 'package:bloc_cubit_practice_simple_todo_app/features/todo/presentation/cubit/add_todo_cubit.dart';
import 'package:bloc_cubit_practice_simple_todo_app/features/todo/presentation/screens/add_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddTodoCubit())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/home",

      routes: {
        '/home': (context) => HomePage(),
        '/add-todo': (context) => AddTodoPage(),
      },
    );
  }
}
