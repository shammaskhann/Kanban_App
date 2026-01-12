part of 'task_board_cubit.dart';

@freezed
class TaskBoardState with _$TaskBoardState {
  const factory TaskBoardState.initial() = _Initial;
  const factory TaskBoardState.changeIndex(int index) = _ChangeIndex;
  const factory TaskBoardState.loading() = _Loading;
  const factory TaskBoardState.loaded({
    required List<TaskEntity> toDo,
    required List<TaskEntity> inProgress,
    required List<TaskEntity> done,
  }) = _Loaded;
  const factory TaskBoardState.error(String message) = _Error;
  const factory TaskBoardState.operationSuccess(String message) =
      _OperationSuccess;
}
