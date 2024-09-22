import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/todo_app/model/task.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  addTask(String title) {
    state = [...state, Task(title: title)];
  }

  removeTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  toggleTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isCompleted: !state[i].isCompleted)
        else
          state[i]
    ];
  }
}

final taskListProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) {
    return TaskNotifier();
  },
);
