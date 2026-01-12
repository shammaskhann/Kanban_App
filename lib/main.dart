import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/presentation/common/constants/route_constant.dart';
import 'package:kanban_app/presentation/common/routes/navigation_route.dart';
import 'package:kanban_app/di/injection.dart' as di;
import 'package:kanban_app/presentation/common/widget/theme_widget/cubit/theme_cubit.dart';
import 'package:kanban_app/core/theme/theme_data.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/comment_cubit.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/task_board_cubit.dart';
import 'package:kanban_app/presentation/screen/dashboard/cubit/dashboard_cubit.dart';
import 'package:kanban_app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:kanban_app/presentation/screen/timer/cubit/time_track_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initializeInjectedDependencies(enableLogger: !kReleaseMode);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => di.getIt<ThemeCubit>()),
        BlocProvider<DashboardCubit>(
          create: (context) => di.getIt<DashboardCubit>(),
        ),
        BlocProvider(create: (context) => di.getIt<HomeCubit>()),
        BlocProvider(create: (context) => di.getIt<TaskBoardCubit>()),
        BlocProvider(create: (context) => di.getIt<TimeTrackCubit>()),
        BlocProvider(create: (context) => di.getIt<CommentCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final currentTheme = state.when(
            initial: () => AppTheme.light,
            loaded: (theme) => theme,
            error: (theme, _) => theme,
          );
          return LayoutBuilder(
            builder: (context, constraints) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppThemeData.lightTheme(),
                darkTheme: AppThemeData.darkTheme(),
                themeMode: currentTheme == AppTheme.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
                onGenerateRoute: GeneratedRoute().onGenerateRoute,
                initialRoute: RouteConstant.splash,
                navigatorKey: di.getIt<GlobalKey<NavigatorState>>(),
              );
            },
          );
        },
      ),
    );
  }
}
