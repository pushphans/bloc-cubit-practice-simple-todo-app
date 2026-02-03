import 'package:bloc_cubit_practice_simple_todo_app/core/shared_services/todo_list.dart';
import 'package:bloc_cubit_practice_simple_todo_app/features/todo/presentation/states/add_todo_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoCubit extends Cubit<AddTodoStates> {
  AddTodoCubit() : super(AddTodoStates());

  void addTodo(String todo) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isAdded: false));

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      todoList.add(todo);
      emit(state.copyWith(isLoading: false, isAdded: true, errorMessage: null));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isAdded: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
