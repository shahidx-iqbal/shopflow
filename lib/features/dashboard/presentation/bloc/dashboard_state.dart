import 'package:equatable/equatable.dart';
import '../../domain/entities/dashboard_summary_entity.dart';

enum DashboardStatus { initial, loading, loaded, error }

class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.initial,
    this.summary,
    this.message,
  });
  final DashboardStatus status;
  final DashboardSummaryEntity? summary;
  final String? message;

  DashboardState copyWith({
    DashboardStatus? status,
    DashboardSummaryEntity? summary,
    String? message,
  }) => DashboardState(
    status: status ?? this.status,
    summary: summary ?? this.summary,
    message: message,
  );

  @override
  List<Object?> get props => [status, summary, message];
}
