import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/domain/usecases/tasks/update_task.dart';
import 'package:kanban_app/presentation/screen/timer/cubit/time_track_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateMocks([GetTasks, UpdateTask])
import 'time_track_cubit_test.mocks.dart';

void main() {
  late TimeTrackCubit cubit;
  late MockGetTasks mockGetTasks;
  late MockUpdateTask mockUpdateTask;

  setUp(() {
    mockGetTasks = MockGetTasks();
    mockUpdateTask = MockUpdateTask();
    cubit = TimeTrackCubit(mockGetTasks, mockUpdateTask);
  });

  tearDown(() {
    cubit.close();
  });

  group('TimeTrackCubit', () {
    final tTodoTask = TaskEntity(
      id: '1',
      content: 'Todo Task',
      status: TaskStatus.todo,
      commentCount: 0,
      deadline: '',
      createdAt: '',
      duration: 0,
    );

    final tInProgressTask = TaskEntity(
      id: '2',
      content: 'In Progress Task',
      status: TaskStatus.inProgress,
      commentCount: 0,
      deadline: '',
      createdAt: '',
      duration: 30,
    );

    final tDoneTask = TaskEntity(
      id: '3',
      content: 'Done Task',
      status: TaskStatus.done,
      commentCount: 0,
      deadline: '',
      createdAt: '',
      duration: 60,
    );

    test('initial state is TimeTrackState.initial', () {
      expect(cubit.state, TimeTrackState.initial());
    });

    test('initial values are correct', () {
      expect(cubit.currentIndex, 0);
      expect(cubit.timeDuration, 0);
      expect(cubit.selectedTask, null);
      expect(cubit.toDoTasks, isEmpty);
      expect(cubit.inProgressTasks, isEmpty);
    });

    group('selectTask', () {
      blocTest<TimeTrackCubit, TimeTrackState>(
        'updates selectedTask and emits selectTask state',
        build: () => cubit,
        act: (cubit) => cubit.selectTask(tTodoTask),
        expect: () => [TimeTrackState.selectTask(tTodoTask)],
        verify: (cubit) {
          expect(cubit.selectedTask, tTodoTask);
        },
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'can select different tasks',
        build: () => cubit,
        act: (cubit) {
          cubit.selectTask(tTodoTask);
          cubit.selectTask(tInProgressTask);
        },
        expect: () => [
          TimeTrackState.selectTask(tTodoTask),
          TimeTrackState.selectTask(tInProgressTask),
        ],
        verify: (cubit) {
          expect(cubit.selectedTask, tInProgressTask);
        },
      );
    });

    group('changeViewOfList', () {
      blocTest<TimeTrackCubit, TimeTrackState>(
        'updates currentIndex and emits changeIndex state',
        build: () => cubit,
        act: (cubit) => cubit.changeViewOfList(1),
        expect: () => [TimeTrackState.changeIndex(1)],
        verify: (cubit) {
          expect(cubit.currentIndex, 1);
        },
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'handles multiple view changes',
        build: () => cubit,
        act: (cubit) {
          cubit.changeViewOfList(0);
          cubit.changeViewOfList(1);
        },
        expect: () => [
          TimeTrackState.changeIndex(0),
          TimeTrackState.changeIndex(1),
        ],
      );
    });

    group('loadTasks', () {
      blocTest<TimeTrackCubit, TimeTrackState>(
        'emits [loading, loaded] with only todo and inProgress tasks',
        build: () {
          when(
            mockGetTasks.call(),
          ).thenAnswer((_) async => [tTodoTask, tInProgressTask, tDoneTask]);
          return cubit;
        },
        act: (cubit) => cubit.loadTasks(),
        expect: () => [
          const TimeTrackState.loading(),
          TimeTrackState.loaded(
            toDo: [tTodoTask],
            inProgress: [tInProgressTask],
          ),
        ],
        verify: (cubit) {
          expect(cubit.toDoTasks, [tTodoTask]);
          expect(cubit.inProgressTasks, [tInProgressTask]);
          // Note: Done tasks are not stored in TimeTrackCubit
        },
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'handles empty task list',
        build: () {
          when(mockGetTasks.call()).thenAnswer((_) async => []);
          return cubit;
        },
        act: (cubit) => cubit.loadTasks(),
        expect: () => [
          const TimeTrackState.loading(),
          TimeTrackState.loaded(toDo: [], inProgress: []),
        ],
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'emits error when loadTasks fails',
        build: () {
          when(mockGetTasks.call()).thenThrow(Exception('Load error'));
          return cubit;
        },
        act: (cubit) => cubit.loadTasks(),
        expect: () => [
          const TimeTrackState.loading(),
          TimeTrackState.error('Failed to load tasks'),
        ],
      );
    });

    group('updateDuration', () {
      blocTest<TimeTrackCubit, TimeTrackState>(
        'updates timeDuration and emits updateDurantion state',
        build: () => cubit,
        act: (cubit) => cubit.updateDuration(120),
        expect: () => [TimeTrackState.updateDurantion(120)],
        verify: (cubit) {
          expect(cubit.timeDuration, 120);
        },
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'handles multiple duration updates',
        build: () => cubit,
        act: (cubit) {
          cubit.updateDuration(60);
          cubit.updateDuration(120);
          cubit.updateDuration(180);
        },
        expect: () => [
          TimeTrackState.updateDurantion(60),
          TimeTrackState.updateDurantion(120),
          TimeTrackState.updateDurantion(180),
        ],
        verify: (cubit) {
          expect(cubit.timeDuration, 180);
        },
      );
    });

    group('updateTaskDuration', () {
      blocTest<TimeTrackCubit, TimeTrackState>(
        'updates task duration and emits success',
        build: () {
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              duration: anyNamed('duration'),
              content: anyNamed('content'),
              status: anyNamed('status'),
            ),
          ).thenAnswer((_) async => Future.value());
          return cubit;
        },
        act: (cubit) => cubit.updateTaskDuration(taskId: '1', duration: 300),
        expect: () => [
          TimeTrackState.operationSuccess('Task duration updated successfully'),
        ],
        verify: (_) {
          verify(mockUpdateTask.call(taskId: '1', duration: 300)).called(1);
        },
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'emits error when updateTaskDuration fails',
        build: () {
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              duration: anyNamed('duration'),
              content: anyNamed('content'),
              status: anyNamed('status'),
            ),
          ).thenThrow(Exception('Update error'));
          return cubit;
        },
        act: (cubit) => cubit.updateTaskDuration(taskId: '1', duration: 300),
        expect: () => [TimeTrackState.error('Failed to update task duration')],
      );

      blocTest<TimeTrackCubit, TimeTrackState>(
        'updates task with zero duration',
        build: () {
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              duration: anyNamed('duration'),
              content: anyNamed('content'),
              status: anyNamed('status'),
            ),
          ).thenAnswer((_) async => Future.value());
          return cubit;
        },
        act: (cubit) => cubit.updateTaskDuration(taskId: '1', duration: 0),
        expect: () => [
          TimeTrackState.operationSuccess('Task duration updated successfully'),
        ],
        verify: (_) {
          verify(mockUpdateTask.call(taskId: '1', duration: 0)).called(1);
        },
      );
    });

    group('Integration scenarios', () {
      blocTest<TimeTrackCubit, TimeTrackState>(
        'can load tasks, select one, update duration, and save',
        build: () {
          when(
            mockGetTasks.call(),
          ).thenAnswer((_) async => [tTodoTask, tInProgressTask]);
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              duration: anyNamed('duration'),
              content: anyNamed('content'),
              status: anyNamed('status'),
            ),
          ).thenAnswer((_) async => Future.value());
          return cubit;
        },
        act: (cubit) async {
          await cubit.loadTasks();
          cubit.selectTask(tTodoTask);
          cubit.updateDuration(150);
          await cubit.updateTaskDuration(taskId: '1', duration: 150);
        },
        expect: () => [
          const TimeTrackState.loading(),
          TimeTrackState.loaded(
            toDo: [tTodoTask],
            inProgress: [tInProgressTask],
          ),
          TimeTrackState.selectTask(tTodoTask),
          TimeTrackState.updateDurantion(150),
          TimeTrackState.operationSuccess('Task duration updated successfully'),
        ],
        verify: (cubit) {
          expect(cubit.selectedTask, tTodoTask);
          expect(cubit.timeDuration, 150);
        },
      );
    });
  });
}
