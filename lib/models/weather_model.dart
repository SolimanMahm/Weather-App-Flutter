class WeatherModel {
  String weatherStateName, image;
  double temp, maxTemp, minTemp;
  DateTime date;

  WeatherModel(
      {required this.date,
      required this.weatherStateName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.image});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        weatherStateName: data['current']['condition']['text'],
        image: data['current']['condition']['icon'],
        temp: data['current']['temp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
}
