part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.changeView(int index) = _ChangeView;
  const factory DashboardState.error(String message) = _Error;
}
