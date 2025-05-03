import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizGamePageState createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '塑膠瓶應該丟到哪一類垃圾桶？',
      'options': ['廚餘垃圾', '可回收垃圾', '有害垃圾', '其他垃圾'],
      'answer': 1,
    },
    {
      'question': '電池屬於哪一類垃圾？',
      'options': ['有害垃圾', '可回收垃圾', '廚餘垃圾', '其他垃圾'],
      'answer': 0,
    },
    {
      'question': '果皮應該丟到哪一類垃圾桶？',
      'options': ['其他垃圾', '可回收垃圾', '廚餘垃圾', '有害垃圾'],
      'answer': 2,
    },
    {
      'question': '玻璃瓶應該丟到哪一類垃圾桶？',
      'options': ['其他垃圾', '廚餘垃圾', '有害垃圾', '可回收垃圾'],
      'answer': 3,
    },
  ];

  void _checkAnswer(int selectedIndex) {
    setState(() {
      _isAnswered = true;
      if (selectedIndex == _questions[_currentQuestionIndex]['answer']) {
        _score++;
        _showFeedback(true);
      } else {
        _showFeedback(false);
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _isAnswered = false;
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showFinalScore();
      }
    });
  }

  void _showFeedback(bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              isCorrect ? 'assets/lottie/correct.json' : 'assets/lottie/incorrect.json',
              height: 150,
            ),
            Text(
              isCorrect ? "正確答案！" : "答案錯誤！",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _nextQuestion();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('下一題'),
            ),
          ],
        ),
      ),
    );
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('遊戲結束！', style: TextStyle(color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '您的總分是：$_score / ${_questions.length}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              'assets/lottie/congratulations.json',
              height: 150,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text('返回主頁'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    return Scaffold(
      body: Column(
        children: [
          // 頁首藍色框
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 81, 156, 218),
            child: const SafeArea(
              child: Center(
                child: Text(
                  '快問快答遊戲',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // 主內容白色背景
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LinearProgressIndicator(
                      value: (_currentQuestionIndex + 1) / _questions.length,
                      color: const Color.fromARGB(255, 81, 156, 218),
                      backgroundColor: Colors.blue[50],
                      minHeight: 8,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '題目 ${_currentQuestionIndex + 1}/${_questions.length}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color.fromARGB(255, 81, 156, 218), width: 2),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        question['question'],
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...List.generate(question['options'].length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: _isAnswered ? null : () => _checkAnswer(index),
                          borderRadius: BorderRadius.circular(15),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color.fromARGB(255, 81, 156, 218), width: 2),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Text(
                                question['options'][index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 81, 156, 218),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
