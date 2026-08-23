import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_dashboard_summary_usecase.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

/// Loads and exposes dashboard summary metrics for the home screen.
@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._getSummary) : super(const DashboardState()) {
    on<DashboardLoadEvent>(_onLoad);
  }
  final GetDashboardSummaryUseCase _getSummary;

  Future<void> _onLoad(DashboardLoadEvent e, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    final r = await _getSummary(const NoParams());
    r.fold(
      (f) => emit(state.copyWith(status: DashboardStatus.error, message: f.message)),
      (s) => emit(state.copyWith(status: DashboardStatus.loaded, summary: s)),
    );
  }
}
