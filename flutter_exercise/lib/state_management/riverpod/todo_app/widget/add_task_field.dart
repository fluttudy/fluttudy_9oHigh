import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/todo_app/provider/task_provider.dart';

class AddTaskField extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  AddTaskField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: '해야할 일을 작성해주세요.',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              ref.read(taskListProvider.notifier).addTask(_controller.text);
              _controller.clear();
            }
          },
        ),
      ],
    );
  }
}
