import 'package:bloc_cubit_practice_simple_todo_app/features/todo/presentation/cubit/add_todo_cubit.dart';
import 'package:bloc_cubit_practice_simple_todo_app/features/todo/presentation/states/add_todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AddTodoCubit>().addTodo(todoController.text);
            },
            icon: Icon(Icons.save_outlined, size: 35),
          ),
        ],
      ),

      body: BlocConsumer<AddTodoCubit, AddTodoStates>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                content: Text(state.errorMessage!),
              ),
            );
          }

          if (state.isAdded == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                content: Text("Todo added successfully!"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        style: TextStyle(fontSize: 22),
                        minLines: 3,
                        maxLines: null,
                        decoration: InputDecoration(
                          label: Text(
                            "Add a todo",
                            style: TextStyle(fontSize: 20),
                          ),
                          hintText: "What needs to be done?",
                          hintStyle: TextStyle(fontSize: 22),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
