import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

final List<String> cities = [
  'seoul',
  'incheon',
  'daegu',
  'daejeon',
  'busan',
  'gwangju',
  "ulsan",
  'jeju'
];

class WeatherNotifier extends StateNotifier<List<Weather>> {
  bool isLoading = true;

  WeatherNotifier() : super([]) {
    Future.microtask(() => setDefaultCities());
  }

  Future<void> fetchWeatherData(String city) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=11e1a77c6c02fb3daff62f196c500616"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Weather weather = Weather.fromJson(data);
      state = [...state, weather];
    }
  }

  Future<void> setDefaultCities() async {
    for (String city in cities) {
      await fetchWeatherData(city);
    }
    isLoading = false;
    state = [...state];
  }

  bool isDuplicated(Weather weather) {
    List<String> cityNames = state.map((w) => w.region).toList();
    if (cityNames.contains(weather.region)) {
      return true;
    }
    return false;
  }

  addCity(Weather weather) {
    state = [
      weather,
      ...state,
    ];
  }

  removeCity(int index) {
    state.removeAt(index);
    state = [
      ...state,
    ];
  }

  toggleFavorite(int index) {
    state[index].isFavorite = !state[index].isFavorite;
    reoder();
  }

  reoder() {
    state.sort((first, second) =>
        (second.isFavorite ? 1 : 0) - (first.isFavorite ? 1 : 0));
    state = [
      ...state,
    ];
  }
}
