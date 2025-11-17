import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisSize: .min,
        children: [
          Transform.scale(scale: .6, child: const CircularProgressIndicator()),
          const SizedBox(height: 10),
          const Text('Checking'),
        ],
      ),
    );
  }
}
