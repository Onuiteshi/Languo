import 'package:flutter/material.dart';
import 'package:language_translator/language_translation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Language Translator Application',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslationPage(),
    );
  }
}
