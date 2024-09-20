import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/counter_app/counter_app.dart';
// import 'package:flutter_ui_exercise/ui/starbucks/contents/login/starbucks_login_screen.dart';

void main() {
  /*
  UI - Starbucks
  runApp(const StarbucksApp());
  */
  runApp(
    // 3. ProviderScope로 앱을 감싸서 Riverpod을 활성화
    const ProviderScope(
      child: CounterApp(),
    ),
  );
}
