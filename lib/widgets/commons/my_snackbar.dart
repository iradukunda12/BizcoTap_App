import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final String message;
  final Duration duration;
  final SnackBarAction? action;

  const MySnackBar({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: duration,
            action: action,
          ),
        );
      },
      child: const Text('Show Snackbar'),
    );
  }
}
