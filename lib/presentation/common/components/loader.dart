import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
