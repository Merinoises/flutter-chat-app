import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotonAzul({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          elevation: WidgetStatePropertyAll(2),
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
          foregroundColor: WidgetStatePropertyAll(Colors.white)),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            texto,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
