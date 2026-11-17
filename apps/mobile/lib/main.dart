import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ZevsGramApp());
}

class ZevsGramApp extends StatelessWidget {
  const ZevsGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    const electricBlue = Color(0xFF55B9FF);
    return MaterialApp(
      title: 'ZevsGram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080A0F),
        colorScheme: const ColorScheme.dark(
          primary: electricBlue,
          secondary: Color(0xFF9BD7FF),
          surface: Color(0xFF111722),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
