import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/ledger_bloc.dart';
import '../bloc/ledger_event.dart';
import '../bloc/ledger_state.dart';
import '../widgets/record_payment_sheet.dart';

/// Deep-link entry for record payment — opens the bottom sheet flow.
class RecordPaymentPage extends StatefulWidget {
  const RecordPaymentPage({required this.customerId, super.key});

  final String customerId;

  @override
  State<RecordPaymentPage> createState() => _RecordPaymentPageState();
}

class _RecordPaymentPageState extends State<RecordPaymentPage> {
  bool _sheetOpened = false;

  Future<void> _openSheet(BuildContext context, LedgerState state) async {
    if (_sheetOpened) return;
    _sheetOpened = true;

    final statement = state.statement;
    if (statement == null) {
      if (context.mounted) context.pop();
      return;
    }

    final recorded = await RecordPaymentSheet.show(
      context,
      customer: statement.customer,
      balance: statement.balance,
      ledgerBloc: context.read<LedgerBloc>(),
    );

    if (!context.mounted) return;

    if (recorded) {
      AppSnackbar.showSuccess(
        context,
        AppLocalizations.of(context)!.ledgerPaymentSuccess,
      );
    }
    context.pop(recorded);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LedgerBloc>()
        ..add(LedgerLoadStatementEvent(customerId: widget.customerId)),
      child: BlocConsumer<LedgerBloc, LedgerState>(
        listener: (context, state) {
          if (state.status == LedgerStatus.loaded && state.statement != null) {
            _openSheet(context, state);
          } else if (state.status == LedgerStatus.error) {
            if (context.mounted) context.pop();
          }
        },
        builder: (context, state) {
          return const Scaffold(body: LoadingWidget());
        },
      ),
    );
  }
}
