import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景純色與插圖
          Positioned.fill(
            child: Container(
              color: const Color(0xFFF3F8FC), // 柔和淺藍背景
              child: const Image(
                image: AssetImage('assets/images/sdgs_background.png'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                opacity: AlwaysStoppedAnimation(0.1), // 背景圖片透明度
              ),
            ),
          ),
          // 主內容
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50), // 頂部空間
                    // 標題文字
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 157, 202, 159), // 明亮綠色背景
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '支持 SDGs 的垃圾回收行動',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // 副標題
                    const Text(
                      '讓我們攜手實現可持續發展目標！',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4A4A4A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    // 分隔用動畫
                    Lottie.asset(
                      'assets/lottie/animated_divider.json',
                      height: 60,
                      repeat: true,
                    ),
                    const SizedBox(height: 30),
                    // 功能按鈕區
                    _buildButton(
                      context,
                      '垃圾分類指導',
                      '/trash_classification_page',
                      const Color.fromARGB(255, 109, 169, 112), // 單色按鈕
                    ),
                    const SizedBox(height: 15),
                    _buildButton(
                      context,
                      '挑戰遊戲',
                      '/quiz_game_page',
                      const Color.fromARGB(255, 81, 156, 218), // 單色按鈕
                    ),
                    const SizedBox(height: 15),
                    _buildButton(
                      context,
                      '環保知識庫',
                      '/knowledge_page',
                      const Color.fromARGB(255, 255, 212, 147), // 單色按鈕
                    ),
                    const SizedBox(height: 50), // 底部空間
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 按鈕設計
  Widget _buildButton(BuildContext context, String text, String route,
      Color backgroundColor) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
