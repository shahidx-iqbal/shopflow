import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_quick_actions.dart';
import '../widgets/dashboard_recent_transactions.dart';
import '../widgets/dashboard_summary_section.dart';
import '../widgets/dashboard_top_selling_section.dart';

/// Home dashboard — responsive mobile and desktop layouts.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardBloc>()..add(const DashboardLoadEvent()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.status == DashboardStatus.loading) {
          return _DashboardScaffold(
            isDesktop: isDesktop,
            title: l10n.dashboardTitle,
            shopName: '',
            body: const LoadingWidget(),
          );
        }
        if (state.status == DashboardStatus.error) {
          return _DashboardScaffold(
            isDesktop: isDesktop,
            title: l10n.dashboardTitle,
            shopName: '',
            body: ErrorStateWidget(
              message: state.message ?? l10n.msgSomethingWentWrong,
              retryLabel: l10n.btnRetry,
              onRetry: () =>
                  context.read<DashboardBloc>().add(const DashboardLoadEvent()),
            ),
          );
        }

        final summary = state.summary ?? const DashboardSummaryEntity();

        return _DashboardScaffold(
          isDesktop: isDesktop,
          title: l10n.dashboardTitle,
          shopName: summary.shopName,
          summary: summary,
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardBloc>().add(const DashboardLoadEvent());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
                isDesktop ? AppDimensions.space32 : AppDimensions.space24,
                isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
                isDesktop
                    ? AppDimensions.space32
                    : ShellLayout.tabContentBottomPadding(context),
              ),
              child: isDesktop
                  ? _DesktopBody(summary: summary)
                  : _MobileBody(summary: summary),
            ),
          ),
        );
      },
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({required this.summary});

  final DashboardSummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DashboardQuickActions(isDesktop: false),
        const SizedBox(height: AppDimensions.space24),
        DashboardTopSellingSection(
          products: summary.topSellingProducts,
          isDesktop: false,
        ),
        const SizedBox(height: AppDimensions.space24),
        DashboardRecentTransactions(
          transactions: summary.recentTransactions,
          isDesktop: false,
        ),
      ],
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({required this.summary});

  final DashboardSummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardHeader(
          shopName: summary.shopName,
          isDesktop: true,
          onNewSale: () => context.push(RouteNames.posCheckout),
        ),
        const SizedBox(height: AppDimensions.space32),
        DashboardSummarySection(summary: summary, isDesktop: true),
        const SizedBox(height: AppDimensions.space32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: DashboardRecentTransactions(
                transactions: summary.recentTransactions,
                isDesktop: true,
              ),
            ),
            const SizedBox(width: AppDimensions.space24),
            Expanded(
              flex: 3,
              child: DashboardQuickActions(isDesktop: true),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.space32),
        DashboardTopSellingSection(
          products: summary.topSellingProducts,
          isDesktop: true,
        ),
      ],
    );
  }
}

/// Mobile uses [DashboardHeader] instead of [AppTopBar]; desktop keeps the app bar.
class _DashboardScaffold extends StatelessWidget {
  const _DashboardScaffold({
    required this.isDesktop,
    required this.title,
    required this.shopName,
    required this.body,
    this.summary,
  });

  final bool isDesktop;
  final String title;
  final String shopName;
  final Widget body;
  final DashboardSummaryEntity? summary;

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(title: title),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: body,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DashboardHeader(
            shopName: shopName,
            isDesktop: false,
            summary: summary,
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}
