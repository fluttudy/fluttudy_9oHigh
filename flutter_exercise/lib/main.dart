import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/screens/weather_screen.dart';
// import 'package:flutter_ui_exercise/state_management/riverpod/counter_app/counter_app.dart';
// import 'package:flutter_ui_exercise/ui/starbucks/contents/login/starbucks_login_screen.dart';
// import 'package:flutter_ui_exercise/state_management/riverpod/todo_app/todo_app.dart';

void main() {
  /*
  UI - Starbucks
  runApp(const StarbucksApp());
  */

  /*
  State Management - Counter App
  const ProviderScope(
      child: CounterApp(),
    ),
  */

  /*
  State Management - Todo App
  const ProviderScope(
      child: MaterialApp(
        home: TodoApp(),
      ),
    ),
  */
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: WeatherScreen(),
      ),
    ),
  );
}
