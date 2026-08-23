import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../customers/presentation/bloc/customers_bloc.dart';
import '../../../customers/presentation/bloc/customers_event.dart';
import '../../../customers/presentation/bloc/customers_state.dart';
import '../../../customers/presentation/widgets/customer_avatar.dart';

/// Bottom sheet to pick a customer for a ledger sale via `GET /customers`.
class CustomerPickerSheet extends StatefulWidget {
  const CustomerPickerSheet({super.key});

  static Future<CustomerEntity?> show(BuildContext context) {
    return showModalBottomSheet<CustomerEntity>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (_) => const CustomerPickerSheet(),
    );
  }

  @override
  State<CustomerPickerSheet> createState() => _CustomerPickerSheetState();
}

class _CustomerPickerSheetState extends State<CustomerPickerSheet> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(BuildContext context, String raw) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!context.mounted) return;
      final query = raw.trim();
      context.read<CustomersBloc>().add(
            CustomersLoadEvent(query: query.isEmpty ? null : query),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return BlocProvider(
      create: (_) => getIt<CustomersBloc>()..add(const CustomersLoadEvent()),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.75,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.space16,
              AppDimensions.space8,
              AppDimensions.space16,
              AppDimensions.space16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppDimensions.space16),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusFull,
                      ),
                    ),
                  ),
                ),
                Text(l10n.posSelectCustomer, style: AppTextStyles.headlineSmall),
                const SizedBox(height: AppDimensions.space16),
                Builder(
                  builder: (context) => AppSearchBar(
                    hint: l10n.customersSearchHint,
                    controller: _searchController,
                    onChanged: (query) {
                      setState(() {});
                      _onSearchChanged(context, query);
                    },
                    onClear: () => _onSearchChanged(context, ''),
                  ),
                ),
                const SizedBox(height: AppDimensions.space12),
                Expanded(
                  child: BlocBuilder<CustomersBloc, CustomersState>(
                    builder: (context, state) {
                      if (state.status == CustomersStatus.loading &&
                          state.customers.isEmpty) {
                        return const LoadingWidget();
                      }
                      if (state.status == CustomersStatus.error &&
                          state.customers.isEmpty) {
                        return ErrorStateWidget(
                          message: state.message ?? l10n.msgSomethingWentWrong,
                          retryLabel: l10n.btnRetry,
                          onRetry: () => context.read<CustomersBloc>().add(
                                CustomersLoadEvent(
                                  query: _searchController.text.trim().isEmpty
                                      ? null
                                      : _searchController.text.trim(),
                                ),
                              ),
                        );
                      }
                      if (state.customers.isEmpty) {
                        return EmptyStateWidget(
                          icon: LucideIcons.users,
                          title: l10n.customersEmptyTitle,
                          subtitle: l10n.customersEmptyHint,
                          actionLabel: l10n.customersAdd,
                          actionIcon: LucideIcons.userPlus,
                          onActionPressed: () async {
                            await context.push(RouteNames.addCustomer);
                            if (context.mounted) {
                              context.read<CustomersBloc>().add(
                                    const CustomersLoadEvent(),
                                  );
                            }
                          },
                        );
                      }
                      return ListView.separated(
                        itemCount: state.customers.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (_, index) {
                          final customer = state.customers[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CustomerAvatar(
                              name: customer.name,
                              radius: 22,
                            ),
                            title: Text(
                              customer.name,
                              style: AppTextStyles.labelMedium,
                            ),
                            subtitle: Text(
                              customer.phone,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.neutral,
                              ),
                            ),
                            trailing: Text(
                              Formatters.currency(customer.balance),
                              style: AppTextStyles.numberSmall.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () => Navigator.pop(context, customer),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
