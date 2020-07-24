/* More about packages here: https://flutter.io/using-packages/ */
import 'package:flutter/material.dart';

/* A relative import, i.e. `import 'category.dart';` or
 a package import, as shown below can be used.
 More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html */
import 'package:category_widget/category.dart';

const _categoryName = 'Click me';
const _categoryIcon = Icons.assignment_ind;
const _categoryColor = Colors.blue;

/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Category(
            name: _categoryName,
            color: _categoryColor,
            iconLocation: _categoryIcon,
          ),
        ),
      ),
    );
  }
}