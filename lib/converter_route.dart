import 'package:category_widget/unit.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatelessWidget {
  /// Units for this [Category].
  final List<Unit> units;
  /// Color for this [Category].
  final Color color;

  final _colorBody = Colors.white;

  /// This [ConverterRoute] requires the color and units to not be null.
  const ConverterRoute({
    @required this.units,
    @required this.color,
  })  : assert(units != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: TextStyle(
                color: _colorBody,
                fontSize:
                Theme.of(context).textTheme.headline5.fontSize,
              ),
            ),
            Text(
              'Conversion: ${unit.conversion}',
                style: TextStyle(
                  color: _colorBody,
                  fontSize:
                  Theme.of(context).textTheme.headline6.fontSize,
                )),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}