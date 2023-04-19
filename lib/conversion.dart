
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}
class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _celsiusToFahrenheitController = TextEditingController();
  final TextEditingController _fahrenheitToCelsiusController = TextEditingController();
  final TextEditingController _celsiusToKelvinController = TextEditingController();
  final TextEditingController _kelvinToCelsiusController = TextEditingController();
  final TextEditingController _fahrenheitToKelvinController = TextEditingController();
  final TextEditingController _kelvinToFahrenheitController = TextEditingController();

  void _convertCelsiusToFahrenheit() {
    final double celsius = double.tryParse(_celsiusToFahrenheitController.text) ?? 0.0;
    final double fahrenheit = (celsius * 9 / 5) + 32;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$celsius °C es igual a $fahrenheit °F')),
    );
  }

  void _convertFahrenheitToCelsius() {
    final double fahrenheit = double.tryParse(_fahrenheitToCelsiusController.text) ?? 0.0;
    final double celsius = (fahrenheit - 32) * 5 / 9;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$fahrenheit °F es igual a $celsius °C')),
    );
  }

  void _convertCelsiusToKelvin() {
    final double celsius = double.tryParse(_celsiusToKelvinController.text) ?? 0.0;
    final double kelvin = celsius + 273.15;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$celsius °C es igual a $kelvin K')),
    );
  }

  void _convertKelvinToCelsius() {
    final double kelvin = double.tryParse(_kelvinToCelsiusController.text) ?? 0.0;
    final double celsius = kelvin - 273.15;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$kelvin K es igual a $celsius °C')),
    );
  }

  void _convertFahrenheitToKelvin() {
    final double fahrenheit = double.tryParse(_fahrenheitToKelvinController.text) ?? 0.0;
    final double kelvin = (fahrenheit + 459.67) * 5 / 9;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$fahrenheit °F es igual a $kelvin K')),
    );
  }

  void _convertKelvinToFahrenheit() {
    final double kelvin = double.tryParse(_kelvinToFahrenheitController.text) ?? 0.0;
    final double fahrenheit = kelvin * 9 / 5 - 459.67;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$kelvin K es igual a $fahrenheit °F')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Temperature Converter'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'C a F'),
              Tab(text: 'C a K'),
              Tab(text: 'F a C'),
              Tab(text: 'F a K'),
              Tab(text: 'K a F'),
              Tab(text: 'K a C'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Celsius to Fahrenheit
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _celsiusToFahrenheitController,
                  decoration: InputDecoration(
                    labelText: 'Celsius',
                    hintText: 'Enter temperature in Celsius',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _convertCelsiusToFahrenheit,
                  child: Text('Convert'),
                ),
              ],
            ),
            // Tab 2: Celsius to Kelvin
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _celsiusToKelvinController,
                  decoration: InputDecoration(
                    labelText: 'Celsius',
                    hintText: 'Enter temperature in Celsius',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _convertCelsiusToKelvin,
                  child: Text('Convert'),
                ),
              ],
            ),
            // Tab 3: Fahrenheit to Celsius
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _fahrenheitToCelsiusController,
                  decoration: InputDecoration(
                    labelText: 'Fahrenheit',
                    hintText: 'Enter temperature in Fahrenheit',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _convertFahrenheitToCelsius,
                  child: Text('Convert'),
                ),
              ],
            ),
            // Tab 4: Fahrenheit to Kelvin
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _fahrenheitToKelvinController,
                  decoration: InputDecoration(
                    labelText: 'Fahrenheit',
                    hintText: 'Enter temperature in Fahrenheit',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _convertFahrenheitToKelvin,
                  child: Text('Convert'),
                ),
              ],
            ),
            // Tab 5: Kelvin to Fahrenheit
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _kelvinToFahrenheitController,
                  decoration: InputDecoration(
                    labelText: 'Kelvin',
                    hintText: 'Enter temperature in Kelvin',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _convertKelvinToFahrenheit,
                  child: Text('Convert'),
                ),
              ],
            ),
            // Tab 6: Kelvin to Celsius
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _kelvinToCelsiusController,
                  decoration: InputDecoration(
                    labelText: 'Kelvin',
                    hintText: 'Enter temperature in Kelvin',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _convertKelvinToCelsius,
                  child: Text('Convert'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>('_celsiusToFahrenheitController', _celsiusToFahrenheitController));
  }
}

