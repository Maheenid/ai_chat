import 'package:ai_chat/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TellMe());
}

class TellMe extends StatelessWidget {
  const TellMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(
          0xff1c1b20,
        ),
        appBarTheme: const AppBarTheme(
          color: Color(
            0xff1c1b20,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
