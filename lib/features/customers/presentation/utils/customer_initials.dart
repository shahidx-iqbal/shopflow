/// Derives display initials from a customer name (e.g. "Ahmed Sharma" → "AS").
String customerInitials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  if (parts.length >= 2) {
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
  if (parts.isNotEmpty && parts.first.isNotEmpty) {
    return parts.first[0].toUpperCase();
  }
  return '?';
}
