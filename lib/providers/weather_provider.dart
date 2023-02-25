import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherDate;
  String? cityName;

  WeatherModel? get weatherDate => _weatherDate;

  set weatherDate(WeatherModel? value) {
    _weatherDate = value;
    notifyListeners();
  }
}