// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_init_to_null
class AddTodoStates {
  final bool isLoading;
  final bool isAdded;
  final String? errorMessage;

  AddTodoStates({
    this.isLoading = false,
    this.isAdded = false,
    this.errorMessage = null,
  });

  AddTodoStates copyWith({
    bool? isLoading,
    bool? isAdded,
    String? errorMessage,
  }) {
    return AddTodoStates(
      isLoading: isLoading ?? this.isLoading,
      isAdded: isAdded ?? this.isAdded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
