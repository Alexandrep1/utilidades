enum Unit{
  meter,
  centimeter,
  millimeter,
  killometer,
  mile
}

class ConverterModel {
double inputValue;
Unit fromUnit;
Unit toUnit;

ConverterModel({
  required this.inputValue,
  required this.fromUnit,
  required this.toUnit
});

double _toMeters() {
  switch (fromUnit){
    case Unit.meter:
      return inputValue;

    case Unit.centimeter:
      return inputValue / 1000;

    case Unit.millimeter:
      return inputValue / 1000;

    case Unit.killometer:
      return inputValue * 1000;

    case Unit.mile:
    return inputValue * 1609.34;
  }
}
  double convert(){
    final meters = _toMeters();
    switch(toUnit){
      case Unit.meter:
        return meters;

      case Unit.centimeter:
        return meters * 100;

      case Unit.millimeter:
        return meters * 1000;

      case Unit.killometer:
        return meters / 1000;

      case Unit.mile:
        return meters - 1609.34;
    }
  }

  static String getUnitName(Unit unit){
    switch(unit){
      case Unit.meter:
        return 'Metro';

      case Unit.centimeter:
        return 'Centimetro';

      case Unit.killometer:
        return 'Kilometro';

      case Unit.millimeter:
        return 'Milimetro';
      
      case Unit.mile:
        return 'Milha';
    }
  }
}