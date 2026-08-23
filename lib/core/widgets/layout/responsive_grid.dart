import 'package:flutter/material.dart';

import '../../constants/app_dimensions.dart';

/// Responsive sliver grid delegates — fixed tile height prevents overflow when
/// column count changes at different screen widths.
class ResponsiveGrid {
  ResponsiveGrid._();

  /// Product / inventory catalog tiles.
  static SliverGridDelegate productCatalog({double maxTileWidth = 200}) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: maxTileWidth,
      mainAxisSpacing: AppDimensions.space12,
      crossAxisSpacing: AppDimensions.space12,
      mainAxisExtent: 280,
    );
  }

  /// Category grid tiles.
  static SliverGridDelegate categories({double maxTileWidth = 160}) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: maxTileWidth,
      mainAxisSpacing: AppDimensions.space12,
      crossAxisSpacing: AppDimensions.space12,
      mainAxisExtent: 168,
    );
  }

  /// Customer card grid tiles.
  static SliverGridDelegate customers({double maxTileWidth = 320}) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: maxTileWidth,
      mainAxisSpacing: AppDimensions.space12,
      crossAxisSpacing: AppDimensions.space12,
      mainAxisExtent: 184,
    );
  }
}
