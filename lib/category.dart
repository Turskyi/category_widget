/* To keep imports tidy, followed the ordering guidelines at
 https://www.dartlang.org/guides/language/effective-dart/style#ordering */
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/* We use an underscore to indicate that these variables are private.
 See https://www.dartlang.org/guides/language/effective-dart/design#libraries */
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);
const _categoryIcon = Icons.assignment_ind;
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

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        super(key: key);

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
            onTap: () {
              print('I was tapped');
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                /* There are two ways to denote a list: `[]` and `List()`.
                 Prefer to use the literal syntax, i.e. `[]`, instead of `List()`.
                 It can be added a type argument if needed, i.e. <Widget>[].
See https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible*/
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: iconLocation != null
                          ? Icon(
                              _categoryIcon,
                              size: _sizeIcon,
                              color: _colorBody,
                            )
                          : null),
                  Center(
                    child: Text(name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _colorBody,
                          fontSize:
                              Theme.of(context).textTheme.headline2.fontSize,
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
