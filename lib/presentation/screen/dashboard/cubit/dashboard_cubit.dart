// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final Logger logger;
  DashboardCubit(this.logger) : super(const DashboardState.initial());

  void changeView(int index) {
    try {
      logger.i("Changing dashboard view to index: $index");
      emit(DashboardState.changeView(index));
    } catch (e) {
      logger.e("Error changing dashboard view: $e");
      emit(DashboardState.error("Failed to change view"));
    }
  }
}
