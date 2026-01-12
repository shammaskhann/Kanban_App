import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_app/data/data_soruces/local/theme_local_data_source.dart';
import 'package:kanban_app/data/data_soruces/remote/remote_comment_datasource.dart';
import 'package:kanban_app/data/data_soruces/remote/remote_task_datasource.dart';
import 'package:kanban_app/data/repositories/comment_repository_impl.dart';
import 'package:kanban_app/data/repositories/task_repository_impl.dart';
import 'package:kanban_app/data/repositories/theme_repository_impl.dart';
import 'package:kanban_app/domain/irepositories/i_comment_repository.dart';
import 'package:kanban_app/domain/irepositories/i_task_repository.dart';
import 'package:kanban_app/domain/irepositories/i_theme_repository.dart';
import 'package:kanban_app/domain/usecases/comments/create_comment.dart';
import 'package:kanban_app/domain/usecases/comments/get_comments.dart';
import 'package:kanban_app/domain/usecases/tasks/create_task.dart';
import 'package:kanban_app/domain/usecases/tasks/delete_task.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/domain/usecases/tasks/update_task.dart';
import 'package:kanban_app/domain/usecases/theme/get_theme.dart';
import 'package:kanban_app/domain/usecases/theme/set_theme.dart';
import 'package:kanban_app/network/client/api_client.dart';
import 'package:kanban_app/presentation/common/routes/generated_route.dart';
import 'package:kanban_app/presentation/common/widget/theme_widget/cubit/theme_cubit.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/comment_cubit.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/task_board_cubit.dart';
import 'package:kanban_app/presentation/screen/dashboard/cubit/dashboard_cubit.dart';
import 'package:kanban_app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:kanban_app/presentation/screen/timer/cubit/time_track_cubit.dart';
import 'package:kanban_app/services/hive_service.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

Future<void> initializeInjectedDependencies({bool enableLogger = false}) async {
  await _injectUtilities(enableLogger: enableLogger);
  await _injectDataSource(enableLogger: enableLogger);
  getIt<Logger>().i("Data sources injected");
  _injectRepositories(enableLogger: enableLogger);
  getIt<Logger>().i("Repositories injected");
  _injectUseCases(enableLogger: enableLogger);
  getIt<Logger>().i("Use cases injected");
  _injectBlocAndCubits(enableLogger: enableLogger);
  getIt<Logger>().i("Blocs and Cubits injected");
}

Future<void> _injectUtilities({bool enableLogger = false}) async {
  //Logger init
  getIt.registerLazySingleton(() => Logger());

  //Navigator init
  getIt.registerLazySingleton(() => NavigationRoute(getIt.get()));

  getIt.registerLazySingleton(() => HiveService());
  await getIt<HiveService>().initialise();
  // Dio init
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioClient(getIt<Dio>()));

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
}

//DATA SOURCE INJECTION
Future<void> _injectDataSource({bool enableLogger = false}) async {
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(
      hiveService: getIt<HiveService>(),
      logger: getIt<Logger>(),
    ),
  );

  getIt.registerLazySingleton<RemoteTaskDatasource>(
    () => RemoteTaskDatasource(
      apiClient: getIt<DioClient>(),
      logger: getIt<Logger>(),
    ),
  );

  getIt.registerLazySingleton<RemoteCommentDatasource>(
    () => RemoteCommentDatasource(
      apiClient: getIt<DioClient>(),
      logger: getIt<Logger>(),
    ),
  );
}

Future<void> _injectUseCases({bool enableLogger = false}) async {
  getIt.registerLazySingleton(() => GetTheme(getIt()));
  getIt.registerLazySingleton(() => SetTheme(getIt()));
  // Task use cases
  getIt.registerLazySingleton(() => GetTasks(getIt<ITaskRepository>()));
  getIt.registerLazySingleton(() => CreateTask(getIt<ITaskRepository>()));
  getIt.registerLazySingleton(() => UpdateTask(getIt<ITaskRepository>()));
  getIt.registerLazySingleton(() => DeleteTask(getIt<ITaskRepository>()));
  // Comment use cases
  getIt.registerLazySingleton(() => GetComments(getIt<ICommentRepository>()));
  getIt.registerLazySingleton(() => CreateComment(getIt<ICommentRepository>()));
}

// Add repository injection
void _injectRepositories({bool enableLogger = false}) {
  getIt.registerLazySingleton<IThemeRepository>(
    () => ThemeRepositoryImpl(localDataSource: getIt()),
  );

  getIt.registerLazySingleton<ITaskRepository>(
    () => TaskRepositoryImpl(
      remoteTaskDatasource: getIt<RemoteTaskDatasource>(),
      localDataSource: getIt<LocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<ICommentRepository>(
    () => CommentRepositoryImpl(
      remoteCommentDatasource: getIt<RemoteCommentDatasource>(),
    ),
  );
}

void _injectBlocAndCubits({bool enableLogger = false}) {
  // Register Blocs and Cubits here
  getIt.registerFactory(
    () => ThemeCubit(getThemeUseCase: getIt(), setThemeUseCase: getIt()),
  );

  getIt.registerFactory(() => DashboardCubit(getIt()));

  getIt.registerFactory(() => HomeCubit(getIt<GetTasks>()));

  getIt.registerFactory(
    () => TaskBoardCubit(
      getIt<GetTasks>(),
      getIt<CreateTask>(),
      getIt<UpdateTask>(),
      getIt<DeleteTask>(),
      getIt<GetComments>(),
      getIt<CreateComment>(),
    ),
  );

  getIt.registerFactory(
    () => TimeTrackCubit(getIt<GetTasks>(), getIt<UpdateTask>()),
  );

  getIt.registerFactory(
    () => CommentCubit(
      getCommentsUseCase: getIt<GetComments>(),
      createCommentUseCase: getIt<CreateComment>(),
    ),
  );
}

void _injectServices({bool enableLogger = false}) {
  // Register Services here
}
