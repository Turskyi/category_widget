/* To keep imports tidy, must be followed the ordering guidelines at
 https://www.dartlang.org/guides/language/effective-dart/style#ordering */
import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

import 'package:category_widget/converter_route.dart';
import 'package:category_widget/unit.dart';

/* We use an underscore to indicate that these variables are private.
 See https://www.dartlang.org/guides/language/effective-dart/design#libraries */
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);
const _sizeIcon = 60.0;
const _colorItemBackground = Colors.transparent;
const _colorBody = Colors.white;

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
                style: TextStyle(
                  color: _colorBody,
                  fontSize:
                  Theme.of(context).textTheme.headline4.fontSize,
                ),
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            units: units,
            color: color,
          ),
        );
      },
    ));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  /* This `context` parameter describes the location of this widget in the
   widget tree. It can be used for obtaining Theme data from the nearest
  Theme ancestor in the tree. Below, we obtain the display1 text theme.
   See https://docs.flutter.io/flutter/material/Theme-class.html */
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
        color: _colorItemBackground,
        child: Container(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: color[50],
            splashColor: color[100],
            /* It can by used either the () => function()
            or the () { function(); } syntax. */
            onTap: () => _navigateToConverter(context),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                /* There are two ways to denote a list: `[]` and `List()`.
                 Prefer to use the literal syntax, i.e. `[]`, instead of `List()`.
                 This way it can be added a type argument if needed, i.e. <Widget>[].
See https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible*/
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Icon(
                              iconLocation,
                              size: _sizeIcon,
                              color: _colorBody,
                            )
                         ),
                  Center(
                    child: Text(name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _colorBody,
                          fontSize:
                              Theme.of(context).textTheme.headline4.fontSize,
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
