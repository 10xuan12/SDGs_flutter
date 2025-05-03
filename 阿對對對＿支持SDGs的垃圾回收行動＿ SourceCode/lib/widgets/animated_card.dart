import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  final String frontText;
  final String backText;

  const AnimatedCard({super.key, required this.frontText, required this.backText});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _isFlipped = false;

  void _toggleFlip() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFlip,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.rotationY(_isFlipped ? 3.1415 : 0),
        decoration: BoxDecoration(
          color: _isFlipped ? Colors.green.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Center(
          child: Text(
            _isFlipped ? widget.backText : widget.frontText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
