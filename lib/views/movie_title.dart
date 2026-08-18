import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  const new({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 234, 24, 24),
        ),
      ),
    );
  }
}
