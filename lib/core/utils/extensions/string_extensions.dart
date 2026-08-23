/// Convenience extensions on [String].
extension StringExtensions on String {
  /// Returns true when the string is null-safe empty or whitespace-only.
  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => !isBlank;

  /// Capitalizes the first character.
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Truncates to [maxLength] appending ellipsis when needed.
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}…';
  }
}
