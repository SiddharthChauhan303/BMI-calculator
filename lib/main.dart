import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMICalculator());
class Palette {
  static const MaterialColor lol =
      const MaterialColor(0xFF0A0E21, const <int, Color>{
              50: const Color(0xffce5641 ),//10% 
      100: const Color(0xff1d1e33),//20% 
      200: const Color(0xffeb1555),//30% 
      300: const Color(0xff111328),//40% 
      400: const Color(0xff8d8e98),//50% 
      500: const Color(0x19eb1555),//60% 
      600: const Color(0xff24d876),//70% 
      700: const Color(0xff2e130e),//80% 
      800: const Color(0xff170907),//90% 
      900: const Color(0xff000000),//100% 
      });
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Palette.lol,
        scaffoldBackgroundColor: Palette.lol,
        textTheme:TextTheme(
            bodyMedium:TextStyle(color: Colors.white) 
          ),
      ),
      // home: InputPage(),
      initialRoute: '/',
      routes: {
          '/':(context)=> InputPage(),
          '/second':(context)=>resultsPage(),
      },
    );
  }
}


