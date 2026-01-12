import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/usecases/comments/create_comment.dart';
import 'package:kanban_app/domain/usecases/comments/get_comments.dart';
import 'package:kanban_app/domain/usecases/tasks/create_task.dart';
import 'package:kanban_app/domain/usecases/tasks/delete_task.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/domain/usecases/tasks/update_task.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/task_board_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateMocks([
  GetTasks,
  CreateTask,
  UpdateTask,
  DeleteTask,
  GetComments,
  CreateComment,
])
import 'task_board_cubit_test.mocks.dart';

void main() {
  late TaskBoardCubit cubit;
  late MockGetTasks mockGetTasks;
  late MockCreateTask mockCreateTask;
  late MockUpdateTask mockUpdateTask;
  late MockDeleteTask mockDeleteTask;
  late MockGetComments mockGetComments;
  late MockCreateComment mockCreateComment;

  setUp(() {
    mockGetTasks = MockGetTasks();
    mockCreateTask = MockCreateTask();
    mockUpdateTask = MockUpdateTask();
    mockDeleteTask = MockDeleteTask();
    mockCreateComment = MockCreateComment();
    mockGetComments = MockGetComments();
    cubit = TaskBoardCubit(
      mockGetTasks,
      mockCreateTask,
      mockUpdateTask,
      mockDeleteTask,
      mockGetComments,
      mockCreateComment,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('TaskBoardCubit', () {
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

    test('initial state is TaskBoardState.initial', () {
      expect(cubit.state, TaskBoardState.initial());
    });

    test('initial currentIndex is 0', () {
      expect(cubit.currentIndex, 0);
    });

    group('changeView', () {
      blocTest<TaskBoardCubit, TaskBoardState>(
        'updates currentIndex and emits changeIndex state',
        build: () => cubit,
        act: (cubit) => cubit.changeView(1),
        expect: () => [TaskBoardState.changeIndex(1)],
        verify: (cubit) {
          expect(cubit.currentIndex, 1);
        },
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'handles multiple view changes',
        build: () => cubit,
        act: (cubit) {
          cubit.changeView(0);
          cubit.changeView(1);
          cubit.changeView(2);
        },
        expect: () => [
          TaskBoardState.changeIndex(0),
          TaskBoardState.changeIndex(1),
          TaskBoardState.changeIndex(2),
        ],
      );
    });

    group('loadTasks', () {
      blocTest<TaskBoardCubit, TaskBoardState>(
        'emits [loading, loaded] with categorized tasks',
        build: () {
          when(
            mockGetTasks.call(),
          ).thenAnswer((_) async => [tTodoTask, tInProgressTask, tDoneTask]);
          return cubit;
        },
        act: (cubit) => cubit.loadTasks(),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.loaded(
            toDo: [tTodoTask],
            inProgress: [tInProgressTask],
            done: [tDoneTask],
          ),
        ],
        verify: (cubit) {
          expect(cubit.toDoTasks, [tTodoTask]);
          expect(cubit.inProgressTasks, [tInProgressTask]);
          expect(cubit.doneTasks, [tDoneTask]);
        },
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'handles empty task list',
        build: () {
          when(mockGetTasks.call()).thenAnswer((_) async => []);
          return cubit;
        },
        act: (cubit) => cubit.loadTasks(),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.loaded(toDo: [], inProgress: [], done: []),
        ],
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'emits error when loadTasks fails',
        build: () {
          when(mockGetTasks.call()).thenThrow(Exception('Load error'));
          return cubit;
        },
        act: (cubit) => cubit.loadTasks(),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.error('Failed to load tasks'),
        ],
      );
    });

    group('addTask', () {
      final newTask = TaskEntity(
        id: '4',
        content: 'New Task',
        status: TaskStatus.todo,
        commentCount: 0,
        deadline: '',
        createdAt: '',
        duration: 0,
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'adds task and emits success',
        build: () {
          when(
            mockCreateTask.call(
              content: anyNamed('content'),
              status: anyNamed('status'),
              duration: anyNamed('duration'),
            ),
          ).thenAnswer((_) async => newTask);
          return cubit;
        },
        act: (cubit) =>
            cubit.addTask(content: 'New Task', status: TaskStatus.todo),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.loaded(toDo: [newTask], inProgress: [], done: []),
          const TaskBoardState.operationSuccess('Task added'),
        ],
        verify: (cubit) {
          verify(
            mockCreateTask.call(
              content: 'New Task',
              status: TaskStatus.todo,
              duration: null,
            ),
          ).called(1);
        },
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'emits error when addTask fails',
        build: () {
          when(
            mockCreateTask.call(
              content: anyNamed('content'),
              status: anyNamed('status'),
              duration: anyNamed('duration'),
            ),
          ).thenThrow(Exception('Add error'));
          return cubit;
        },
        act: (cubit) =>
            cubit.addTask(content: 'New Task', status: TaskStatus.todo),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.error('Failed to add task'),
        ],
      );
    });

    group('updateTask', () {
      blocTest<TaskBoardCubit, TaskBoardState>(
        'updates task and emits success',
        build: () {
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              content: anyNamed('content'),
              status: anyNamed('status'),
              duration: anyNamed('duration'),
            ),
          ).thenAnswer((_) async => Future.value());

          // Pre-load a task
          cubit.toDoTasks.add(tTodoTask);
          return cubit;
        },
        act: (cubit) => cubit.updateTask(
          taskId: '1',
          content: 'Updated Task',
          status: TaskStatus.inProgress,
        ),
        expect: () => [
          const TaskBoardState.loading(),
          isA<TaskBoardState>(), // loaded state after moving task
          const TaskBoardState.operationSuccess('Task updated'),
        ],
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'emits error when updateTask fails',
        build: () {
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              content: anyNamed('content'),
              status: anyNamed('status'),
              duration: anyNamed('duration'),
            ),
          ).thenThrow(Exception('Update error'));
          return cubit;
        },
        act: (cubit) => cubit.updateTask(
          taskId: '1',
          content: 'Updated',
          status: TaskStatus.todo,
        ),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.error('Failed to update task'),
        ],
      );
    });

    group('deleteTask', () {
      blocTest<TaskBoardCubit, TaskBoardState>(
        'deletes task and emits success',
        build: () {
          when(
            mockDeleteTask.call(any),
          ).thenAnswer((_) async => Future.value());

          // Pre-load tasks
          cubit.toDoTasks.add(tTodoTask);
          cubit.inProgressTasks.add(tInProgressTask);
          return cubit;
        },
        act: (cubit) => cubit.deleteTask('1'),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.loaded(
            toDo: [],
            inProgress: [tInProgressTask],
            done: [],
          ),
          const TaskBoardState.operationSuccess('Task deleted'),
        ],
        verify: (cubit) {
          verify(mockDeleteTask.call('1')).called(1);
          expect(cubit.toDoTasks, isEmpty);
        },
      );

      blocTest<TaskBoardCubit, TaskBoardState>(
        'emits error when deleteTask fails',
        build: () {
          when(mockDeleteTask.call(any)).thenThrow(Exception('Delete error'));
          return cubit;
        },
        act: (cubit) => cubit.deleteTask('1'),
        expect: () => [
          const TaskBoardState.loading(),
          TaskBoardState.error('Failed to delete task'),
        ],
      );
    });

    group('completeTask', () {
      blocTest<TaskBoardCubit, TaskBoardState>(
        'moves task to done list',
        build: () {
          when(
            mockUpdateTask.call(
              taskId: anyNamed('taskId'),
              status: anyNamed('status'),
              content: anyNamed('content'),
              duration: anyNamed('duration'),
            ),
          ).thenAnswer((_) async => Future.value());

          cubit.toDoTasks.add(tTodoTask);
          return cubit;
        },
        act: (cubit) => cubit.completeTask('1'),
        verify: (cubit) {
          expect(cubit.doneTasks.length, 1);
          expect(cubit.doneTasks.first.status, TaskStatus.done);
          expect(cubit.toDoTasks, isEmpty);
        },
      );
    });
  });
}
