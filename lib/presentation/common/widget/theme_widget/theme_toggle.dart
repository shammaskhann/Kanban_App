import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/presentation/common/widget/theme_widget/cubit/theme_cubit.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final currentTheme = state.when(
          initial: () => AppTheme.light,
          loaded: (theme) => theme,
          error: (theme, _) => theme,
        );
        final iconColor = currentTheme == AppTheme.dark
            ? Colors.amber
            : Colors.blueGrey;
        return Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    currentTheme == AppTheme.dark
                        ? Icons.nightlight_rounded
                        : Icons.wb_sunny,
                    color: iconColor,
                  ),
                  const SizedBox(width: 12),
                  Text("Theme Mode"),
                ],
              ),
              GestureDetector(
                onTap: context.read<ThemeCubit>().toggleTheme,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + (_animation.value * 0.05),
                      child: Container(
                        width: 70,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: currentTheme == AppTheme.dark
                                ? [Colors.blueGrey[700]!, Colors.indigo[800]!]
                                : [Colors.amber[100]!, Colors.orange[100]!],
                          ),
                        ),
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              curve: Curves.easeInOut,
                              left: currentTheme == AppTheme.dark ? 34 : 4,
                              top: 3,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentTheme == AppTheme.dark
                                      ? Colors.blueGrey[300]
                                      : Colors.amber[300],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (child, animation) {
                                    return RotationTransition(
                                      turns: animation,
                                      child: ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    currentTheme == AppTheme.dark
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                    key: ValueKey<bool>(
                                      currentTheme == AppTheme.dark,
                                    ),
                                    color: currentTheme == AppTheme.dark
                                        ? Colors.white
                                        : Colors.orange[800],
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
