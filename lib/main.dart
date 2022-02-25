import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/input_screen.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: const ColorScheme.dark(
          secondary: kSecondaryColor
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 29, 33, 54),
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: kSecondaryColor,// Navigation bar
              statusBarColor: kBackgroundColor, // Status bar
            )
        ),
      ),
      home: InputPage(),
    );
  }
}

