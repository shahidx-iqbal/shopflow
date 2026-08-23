import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/report_summary_entity.dart';
import '../../domain/usecases/get_report_usecase.dart';

enum ReportsStatus { initial, loading, loaded, error }

class ReportsState extends Equatable {
  const ReportsState({
    this.status = ReportsStatus.initial,
    this.report,
    this.startDate,
    this.endDate,
    this.message,
  });

  final ReportsStatus status;
  final ReportSummaryEntity? report;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? message;

  ReportsState copyWith({
    ReportsStatus? status,
    ReportSummaryEntity? report,
    DateTime? startDate,
    DateTime? endDate,
    String? message,
  }) =>
      ReportsState(
        status: status ?? this.status,
        report: report ?? this.report,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        message: message,
      );

  bool get isTodaySelected {
    final start = startDate;
    final end = endDate;
    if (start == null || end == null) return true;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return _isSameDay(start, today) && _isSameDay(end, today);
  }

  static bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  List<Object?> get props => [status, report, startDate, endDate, message];
}

/// Loads shop reports for a selected date range.
@injectable
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(this._getReport) : super(const ReportsState());

  final GetReportUseCase _getReport;

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  Future<void> loadToday() => loadReport(startDate: _today(), endDate: _today());

  Future<void> loadReport({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final start = startDate ?? state.startDate ?? _today();
    final end = endDate ?? state.endDate ?? _today();
    final normalizedStart = DateTime(start.year, start.month, start.day);
    final normalizedEnd = DateTime(end.year, end.month, end.day);

    emit(
      state.copyWith(
        status: ReportsStatus.loading,
        startDate: normalizedStart,
        endDate: normalizedEnd,
        message: null,
      ),
    );

    final result = await _getReport(
      GetReportParams(startDate: normalizedStart, endDate: normalizedEnd),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ReportsStatus.error,
          message: failure.message,
        ),
      ),
      (report) => emit(
        state.copyWith(
          status: ReportsStatus.loaded,
          report: report,
        ),
      ),
    );
  }
}
