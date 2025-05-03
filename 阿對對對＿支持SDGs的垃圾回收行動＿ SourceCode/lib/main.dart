import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/trash_classification_page.dart'; // 確保導入 TrashClassificationPage 頁面
import 'pages/quiz_game_page.dart';
import 'pages/knowledge_page.dart';
void main() {
  runApp(const TrashBotApp());
}

class TrashBotApp extends StatelessWidget {
  const TrashBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '垃圾去哪兒',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/trash_classification_page': (context) => TrashClassificationPage(),
        '/quiz_game_page': (context) => const QuizGamePage(),
        '/knowledge_page': (context) => const KnowledgePage(),
      },
    );
  }
}
