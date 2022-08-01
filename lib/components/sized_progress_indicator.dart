import 'package:flutter/material.dart';

class SizedProgressIndicator extends StatelessWidget {
  const SizedProgressIndicator({
    super.key,
    this.size = 36,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
