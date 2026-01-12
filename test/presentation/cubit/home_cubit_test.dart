import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateMocks([GetTasks])
import 'home_cubit_test.mocks.dart';

void main() {
  late HomeCubit cubit;
  late MockGetTasks mockGetTasks;

  setUp(() {
    mockGetTasks = MockGetTasks();
    cubit = HomeCubit(mockGetTasks);
  });

  tearDown(() {
    cubit.close();
  });

  group('HomeCubit', () {
    final tTasks = [
      TaskEntity(
        id: '1',
        content: 'Task 1',
        status: TaskStatus.todo,
        commentCount: 0,
        deadline: '',
        createdAt: '',
        duration: 0,
      ),
      TaskEntity(
        id: '2',
        content: 'Task 2',
        status: TaskStatus.inProgress,
        commentCount: 0,
        deadline: '',
        createdAt: '',
        duration: 30,
      ),
      TaskEntity(
        id: '3',
        content: 'Task 3',
        status: TaskStatus.done,
        commentCount: 0,
        deadline: '',
        createdAt: '',
        duration: 60,
      ),
    ];

    test('initial state is HomeState.initial', () {
      expect(cubit.state, HomeState.initial());
    });

    blocTest<HomeCubit, HomeState>(
      'emits [loading, taskLoaded] when fetchTasks succeeds',
      build: () {
        when(mockGetTasks.call()).thenAnswer((_) async => tTasks);
        return cubit;
      },
      act: (cubit) => cubit.fetchTasks(),
      expect: () => [HomeState.loading(), HomeState.taskLoaded(tTasks)],
      verify: (_) {
        verify(mockGetTasks.call()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'calculates task counts correctly',
      build: () {
        when(mockGetTasks.call()).thenAnswer((_) async => tTasks);
        return cubit;
      },
      act: (cubit) => cubit.fetchTasks(),
      verify: (cubit) {
        expect(cubit.totalTasks, 3);
        expect(cubit.toDoTasks, 1);
        expect(cubit.inProgressTasks, 1);
        expect(cubit.doneTasks, 1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'handles empty task list',
      build: () {
        when(mockGetTasks.call()).thenAnswer((_) async => []);
        return cubit;
      },
      act: (cubit) => cubit.fetchTasks(),
      expect: () => [HomeState.loading(), HomeState.taskLoaded([])],
      verify: (cubit) {
        expect(cubit.totalTasks, 0);
        expect(cubit.toDoTasks, 0);
        expect(cubit.inProgressTasks, 0);
        expect(cubit.doneTasks, 0);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, error] when fetchTasks fails',
      build: () {
        when(mockGetTasks.call()).thenThrow(Exception('Fetch error'));
        return cubit;
      },
      act: (cubit) => cubit.fetchTasks(),
      expect: () => [
        HomeState.loading(),
        HomeState.error('An error occurred while fetching tasks.'),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'counts only todo tasks correctly',
      build: () {
        final todoTasks = [
          TaskEntity(
            id: '1',
            content: 'Task 1',
            status: TaskStatus.todo,
            commentCount: 0,
            deadline: '',
            createdAt: '',
            duration: 0,
          ),
          TaskEntity(
            id: '2',
            content: 'Task 2',
            status: TaskStatus.todo,
            commentCount: 0,
            deadline: '',
            createdAt: '',
            duration: 0,
          ),
        ];
        when(mockGetTasks.call()).thenAnswer((_) async => todoTasks);
        return cubit;
      },
      act: (cubit) => cubit.fetchTasks(),
      verify: (cubit) {
        expect(cubit.totalTasks, 2);
        expect(cubit.toDoTasks, 2);
        expect(cubit.inProgressTasks, 0);
        expect(cubit.doneTasks, 0);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'stores fetched tasks in cubit',
      build: () {
        when(mockGetTasks.call()).thenAnswer((_) async => tTasks);
        return cubit;
      },
      act: (cubit) => cubit.fetchTasks(),
      verify: (cubit) {
        expect(cubit.tasks, tTasks);
        expect(cubit.tasks.length, 3);
      },
    );
  });
}
