import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KnowledgePage extends StatelessWidget {
  const KnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '環保知識',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 212, 147),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // 全局背景動畫
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Lottie.asset(
                'assets/lottie/green_leaves_background.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Lottie.asset(
                  'assets/lottie/earth_recycle.json',
                  height: 200,
                  repeat: true,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildCard(
                      title: '塑膠瓶如何處理？',
                      description: '塑膠瓶應清洗後，投入藍色回收桶。',
                    ),
                    _buildCard(
                      title: '電池如何處理？',
                      description: '電池屬於有害垃圾，需專項回收。',
                    ),
                    _buildCard(
                      title: '廚餘如何分類？',
                      description: '廚餘需去除塑膠袋後，投入綠色垃圾桶。',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required String description}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
