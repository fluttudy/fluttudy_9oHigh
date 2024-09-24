class Weather {
  final String weatherIcon;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final String region;
  final String stateDescription;
  final int humidity;
  final double wind;
  bool isFavorite;

  Weather({
    required this.weatherIcon,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.region,
    required this.stateDescription,
    required this.humidity,
    required this.wind,
    this.isFavorite = false,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var weatherList = json['weather'] as List;
    var weather = weatherList[0];

    return Weather(
      weatherIcon:
          "https://openweathermap.org/img/wn/${weather["icon"]}@2x.png",
      currentTemp: json["main"]["temp"] - 273.15,
      maxTemp: json["main"]["temp_max"] - 273.15,
      minTemp: json["main"]["temp_min"] - 273.15,
      region: json["name"],
      stateDescription: weather["description"],
      humidity: json["main"]["humidity"],
      wind: json["wind"]["speed"],
      isFavorite: false,
    );
  }
}
