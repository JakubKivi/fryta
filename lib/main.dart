import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fryta/screens/home_screen.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  
  runApp(Fryta(theme: theme));
}

class Fryta extends StatelessWidget {
  
  final ThemeData theme;
  const Fryta({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fryta',
      theme: theme,
      home: const HomeScreen(title: 'Fryta'),
    );
  }
}



