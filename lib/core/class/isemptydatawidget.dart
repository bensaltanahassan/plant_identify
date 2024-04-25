import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IsEmptyDataWidget extends StatelessWidget {
  const IsEmptyDataWidget(
      {super.key,
      required this.text,
      required this.child,
      required this.lottieFile,
      required this.isEmpty});
  final String text;
  final Widget child;
  final String lottieFile;
  final bool isEmpty;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Center(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(lottieFile, height: 250),
              const SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ))
        : child;
  }
}
