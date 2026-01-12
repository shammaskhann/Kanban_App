part of 'time_track_cubit.dart';

@freezed
class TimeTrackState with _$TimeTrackState {
  const factory TimeTrackState.initial() = _Initial;
  const factory TimeTrackState.changeIndex(int index) = _ChangeIndex;
  const factory TimeTrackState.loading() = _Loading;
  const factory TimeTrackState.loaded({
    required List<TaskEntity> toDo,
    required List<TaskEntity> inProgress,
  }) = _Loaded;
  const factory TimeTrackState.error(String message) = _Error;
  const factory TimeTrackState.operationSuccess(String message) =
      _OperationSuccess;

  const factory TimeTrackState.updateDurantion(int duration) = _UpdateDuration;
  const factory TimeTrackState.selectTask(TaskEntity task) = _SelectTask;
}
