/* More about packages here: https://flutter.io/using-packages/ */
import 'package:flutter/material.dart';

/* A relative import, i.e. `import 'category.dart';` or
 a package import, as shown below can be used.
 More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html */
import 'package:category_widget/category_route.dart';

/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
}

/// This widget is the root of our application.
///
/// The first screen we see is a list [Categories].
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}