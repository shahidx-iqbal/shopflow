import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/report_summary_entity.dart';
import '../cubit/reports_cubit.dart';
import '../utils/report_export_builder.dart';
import '../widgets/reports_best_customer_tile.dart';
import '../widgets/reports_date_filter_bar.dart';
import '../widgets/reports_date_range_sheet.dart';
import '../widgets/reports_summary_section.dart';
import '../widgets/reports_top_product_tile.dart';

/// Shop reports with date filter, summary metrics, and ranked lists.
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  Future<void> _pickDateRange(BuildContext context, ReportsState state) async {
    final cubit = context.read<ReportsCubit>();
    final start = state.startDate ?? DateTime.now();
    final end = state.endDate ?? DateTime.now();

    final result = await ReportsDateRangeSheet.show(
      context,
      initialStart: start,
      initialEnd: end,
    );
    if (result != null && context.mounted) {
      await cubit.loadReport(startDate: result.$1, endDate: result.$2);
    }
  }

  Future<void> _exportReport(BuildContext context, ReportsState state) async {
    final l10n = AppLocalizations.of(context)!;
    final report = state.report;
    if (report == null) return;

    await SharePlus.instance.share(
      ShareParams(text: ReportExportBuilder.build(l10n, report)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    return BlocProvider(
      create: (_) => getIt<ReportsCubit>()..loadToday(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(
          title: l10n.reportsAnalyticsTitle,
          showBackButton: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1280 : double.infinity,
            ),
            child: BlocBuilder<ReportsCubit, ReportsState>(
              builder: (context, state) {
                if (state.status == ReportsStatus.loading &&
                    state.report == null) {
                  return const LoadingWidget();
                }

                if (state.status == ReportsStatus.error &&
                    state.report == null) {
                  return ErrorStateWidget(
                    message: state.message ?? l10n.msgSomethingWentWrong,
                    retryLabel: l10n.btnRetry,
                    onRetry: () => context.read<ReportsCubit>().loadToday(),
                  );
                }

                final report = state.report;
                final isEmpty = report == null ||
                    (report.totalSales == 0 &&
                        report.topProducts.isEmpty &&
                        report.bestCustomers.isEmpty);

                return RefreshIndicator(
                  onRefresh: () => context.read<ReportsCubit>().loadReport(
                        startDate: state.startDate,
                        endDate: state.endDate,
                      ),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      isDesktop
                          ? AppDimensions.space32
                          : AppDimensions.pagePadding,
                      isDesktop
                          ? AppDimensions.space32
                          : AppDimensions.space16,
                      isDesktop
                          ? AppDimensions.space32
                          : AppDimensions.pagePadding,
                      ShellLayout.detailContentBottomPadding(context),
                    ),
                    children: [
                      Text(
                        l10n.reportsAnalyticsSubtitle,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.neutral,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.space16),
                      ReportsDateFilterBar(
                        state: state,
                        onToday: () => context.read<ReportsCubit>().loadToday(),
                        onPickRange: () => _pickDateRange(context, state),
                        onExport: () => _exportReport(context, state),
                      ),
                      if (state.status == ReportsStatus.loading)
                        const Padding(
                          padding:
                              EdgeInsets.only(top: AppDimensions.space24),
                          child: LinearProgressIndicator(
                            color: AppColors.primary,
                            backgroundColor: AppColors.border,
                          ),
                        ),
                      const SizedBox(height: AppDimensions.space24),
                      if (isEmpty)
                        EmptyStateWidget(
                          icon: LucideIcons.chartBar,
                          title: l10n.reportsEmptyTitle,
                          subtitle: l10n.reportsEmptySubtitle,
                        )
                      else
                        _ReportsContent(
                          report: report,
                          isDesktop: isDesktop,
                          onViewLedger: () =>
                              context.push(RouteNames.ledgerList),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ReportsContent extends StatelessWidget {
  const _ReportsContent({
    required this.report,
    required this.isDesktop,
    required this.onViewLedger,
  });

  final ReportSummaryEntity report;
  final bool isDesktop;
  final VoidCallback onViewLedger;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasProducts = report.topProducts.isNotEmpty;
    final hasCustomers = report.bestCustomers.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ReportsSummarySection(
          report: report,
          isDesktop: isDesktop,
          onViewLedger: onViewLedger,
        ),
        if (hasProducts || hasCustomers) ...[
          SizedBox(
            height: isDesktop ? AppDimensions.space32 : AppDimensions.space24,
          ),
          if (isDesktop && hasProducts && hasCustomers)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _RankedListSection(
                    title: l10n.reportsTopProductsVolume,
                    child: Column(
                      children: [
                        for (var i = 0; i < report.topProducts.length; i++)
                          ReportsTopProductTile(
                            rank: i + 1,
                            product: report.topProducts[i],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.space24),
                Expanded(
                  child: _RankedListSection(
                    title: l10n.reportsBestCustomersValue,
                    child: Column(
                      children: [
                        for (final customer in report.bestCustomers)
                          ReportsBestCustomerTile(customer: customer),
                      ],
                    ),
                  ),
                ),
              ],
            )
          else ...[
            if (hasProducts) ...[
              _RankedListSection(
                title: l10n.reportsTopProductsVolume,
                child: Column(
                  children: [
                    for (var i = 0; i < report.topProducts.length; i++)
                      ReportsTopProductTile(
                        rank: i + 1,
                        product: report.topProducts[i],
                      ),
                  ],
                ),
              ),
              if (hasCustomers)
                SizedBox(
                  height: isDesktop
                      ? AppDimensions.space32
                      : AppDimensions.space24,
                ),
            ],
            if (hasCustomers)
              _RankedListSection(
                title: l10n.reportsBestCustomersValue,
                child: Column(
                  children: [
                    for (final customer in report.bestCustomers)
                      ReportsBestCustomerTile(customer: customer),
                  ],
                ),
              ),
          ],
        ],
      ],
    );
  }
}

class _RankedListSection extends StatelessWidget {
  const _RankedListSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppTextStyles.headlineSmall),
        const SizedBox(height: AppDimensions.space12),
        AppCard(child: child),
      ],
    );
  }
}
