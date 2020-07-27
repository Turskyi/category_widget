/* To keep imports tidy, must be followed the ordering guidelines at
 https://www.dartlang.org/guides/language/effective-dart/style#ordering */
import 'package:category_widget/unit.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// A [Category] keeps track of a list of [Unit]s.
class Category {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  /// Information about a [Category].
  /// A [Category] saves the name of the Category (e.g. 'Length'), a list of its
  /// its color for the UI, units for conversions (e.g. 'Millimeter', 'Meter'),
  /// and the icon that represents it (e.g. a ruler).
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null);
}
