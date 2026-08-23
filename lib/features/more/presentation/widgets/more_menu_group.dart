import 'package:flutter/material.dart';

import '../../../../core/widgets/cards/app_card.dart';

/// White grouped card wrapping multiple [MoreMenuTile] rows.
class MoreMenuGroup extends StatelessWidget {
  const MoreMenuGroup({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
