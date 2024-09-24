import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/models/weather.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/providers/weather_notifier.dart';

final weatherListProvider =
    StateNotifierProvider<WeatherNotifier, List<Weather>>((ref) {
  return WeatherNotifier();
});
