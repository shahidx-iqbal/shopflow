import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

/// Local storage wrapper around Hive (cart drafts and optional caches).
@lazySingleton
class HiveService {
  static const String productsBox = 'products';
  static const String cartBox = 'cart';
  static const String customersBox = 'customers';
  static const String categoriesBox = 'categories';
  static const String dashboardBox = 'dashboard';
  static const String salesBox = 'sales';
  static const String ledgerBox = 'ledger';
  static const String inventoryBox = 'inventory';
  static const String reportsBox = 'reports';
  static const String settingsBox = 'settings';

  bool _initialized = false;

  /// Initializes Hive and opens commonly used boxes.
  Future<void> init() async {
    if (_initialized) return;
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox<dynamic>(productsBox),
      Hive.openBox<dynamic>(cartBox),
      Hive.openBox<dynamic>(customersBox),
      Hive.openBox<dynamic>(categoriesBox),
      Hive.openBox<dynamic>(dashboardBox),
      Hive.openBox<dynamic>(salesBox),
      Hive.openBox<dynamic>(ledgerBox),
      Hive.openBox<dynamic>(inventoryBox),
      Hive.openBox<dynamic>(reportsBox),
      Hive.openBox<dynamic>(settingsBox),
    ]);
    _initialized = true;
  }

  Box<dynamic> box(String name) => Hive.box<dynamic>(name);

  Future<void> put(String boxName, String key, dynamic value) async {
    await box(boxName).put(key, value);
  }

  dynamic get(String boxName, String key, {dynamic defaultValue}) {
    return box(boxName).get(key, defaultValue: defaultValue);
  }

  Future<void> delete(String boxName, String key) async {
    await box(boxName).delete(key);
  }

  Future<void> clear(String boxName) async {
    await box(boxName).clear();
  }

  Future<void> putAll(String boxName, Map<String, dynamic> entries) async {
    await box(boxName).putAll(entries);
  }

  List<dynamic> values(String boxName) => box(boxName).values.toList();

  bool containsKey(String boxName, String key) =>
      box(boxName).containsKey(key);
}
