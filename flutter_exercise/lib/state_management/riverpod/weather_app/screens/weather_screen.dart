import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/models/weather.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/providers/weather_notifier.dart';
import 'package:flutter_ui_exercise/state_management/riverpod/weather_app/providers/weather_provider.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherList = ref.watch(weatherListProvider);
    final notifier = ref.read(weatherListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 195, 195, 195),
        title: const Text(
          '오늘의 날씨',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: WeatherSearchDelegate(notifier: notifier),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 195, 195, 195),
      body: notifier.isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: weatherList.length,
                      itemBuilder: (context, index) {
                        final weather = weatherList[index];

                        return Dismissible(
                          key: Key(weather.region),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: const Color.fromARGB(255, 185, 65, 56),
                            alignment: Alignment.center,
                            child: const Text(
                              "해당 지역이 삭제됩니다",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onDismissed: (direction) =>
                              notifier.removeCity(index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 4.0,
                            ),
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 4,
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              weather.weatherIcon,
                                              width: 80,
                                              height: 80,
                                            ),
                                            Text(
                                              weather.region,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "현재: ${weather.currentTemp.toStringAsFixed(1)}°C",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "최고: ${weather.maxTemp.toStringAsFixed(1)}°C",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "최저: ${weather.minTemp.toStringAsFixed(1)}°C",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              weather.stateDescription,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "습도: ${weather.humidity}%",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "바람: ${weather.wind} m/s",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: IconButton(
                                    icon: Icon(
                                      weather.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: weather.isFavorite
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 20,
                                    ),
                                    onPressed: () =>
                                        notifier.toggleFavorite(index),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class WeatherSearchDelegate extends SearchDelegate {
  final WeatherNotifier notifier;
  WeatherSearchDelegate({required this.notifier});

  @override
  InputDecorationTheme get searchFieldDecorationTheme {
    return const InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 200, 200, 200),
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.black54),
      focusedBorder: InputBorder.none,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 195, 195, 195),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query.isEmpty ? close(context, null) : query = '',
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 195, 195, 195),
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => close(context, null),
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 195, 195, 195),
      child: FutureBuilder<List<Weather>>(
        future: fetchWeather(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('검색 결과가 없습니다.'),
            );
          } else {
            final weathers = snapshot.data!;
            return ListView.builder(
              itemCount: weathers.length,
              itemBuilder: (context, index) {
                final weather = weathers[index];
                return ListTile(
                  title: Text(weather.region),
                  subtitle:
                      Text("현재: ${weather.currentTemp.toStringAsFixed(1)}°C"),
                  trailing: IconButton(
                    onPressed: () {
                      if (!notifier.isDuplicated(weather)) {
                        notifier.addCity(weather);
                        close(context, null);
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: const Text(
                                  "중복 안내",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                content: const Text(
                                    "이미 등록된 도시입니다 : )\n다른 도시를 검색해보세요!"),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                        Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "확인",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  onTap: null,
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 195, 195, 195),
      child: const Center(
        child: Text('도시 이름을 입력하세요.'),
      ),
    );
  }

  Future<List<Weather>> fetchWeather(String query) async {
    const apiKey = '11e1a77c6c02fb3daff62f196c500616';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final weather = Weather.fromJson(json);
      return [weather];
    } else {
      return [];
    }
  }
}
