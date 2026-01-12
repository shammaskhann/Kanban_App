import 'package:flutter/material.dart';
import 'package:kanban_app/core/utils/utils_helper.dart';

class TimerControls extends StatelessWidget {
  final int elapsedSeconds;
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onEnd;

  const TimerControls({
    super.key,
    required this.elapsedSeconds,
    required this.isRunning,
    required this.onStart,
    required this.onStop,
    required this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final timeLabel = DateHelper.secondsToShortTimeString(elapsedSeconds);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Elapsed Time', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              Text(
                timeLabel,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isRunning ? null : onStart,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isRunning ? onStop : null,
                icon: const Icon(Icons.pause),
                label: const Text('Stop'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: elapsedSeconds > 0 ? onEnd : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                ),
                icon: const Icon(Icons.stop_circle_outlined),
                label: const Text('End'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
