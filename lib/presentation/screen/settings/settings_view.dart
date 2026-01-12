import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/common/widget/theme_widget/theme_toggle.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Column(
          children: [
            Text(
              'Kanban App - Settings',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),
            const ThemeToggle(),
          ],
        ),
      ),
    );
  }
}
