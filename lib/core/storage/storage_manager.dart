import 'package:aloplay_simulation/features/club_category/data/models/club_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageManager {
  Future<void> setString(String key, String? value);
  Future<void> setInt(String key, int? value);
  Future<void> setBoolean(String key, bool value);
  Future<void> remove(String key);
  Future<String?> getString(String key);
  Future<int?> getInt(String key);
  Future<bool> getBoolean(String key);
  Future<void> saveClubCategoryId(int id);
  Future<int> getClubCategoryId();
  ValueNotifier<int> get clubCategoryIdNotifier;
  Future<void> saveBusinessModelType(int id);
  Future<int> getBusinessModelType();
  ValueNotifier<int> get clubBusinessModelTypeNotifier;
  Future<void> saveClubCategoryName(String name);
  Future<String> getClubCategoryName();
  Future<void> saveClubCategories(List<ClubCategoryCacheModel> categories);
  Future<ClubCategoryCacheModel?> getClubCategoryBySeoName(String seoName);
  Future<List<ClubCategoryCacheModel>> getClubCategories();
}

class StorageManagerImpl implements StorageManager {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _clubCategoriesKey = 'club_categories';

  @override
  Future<void> setString(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<void> setInt(String key, int? value) async {
    await _storage.write(key: key, value: value?.toString());
  }

  @override
  Future<void> setBoolean(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<bool> getBoolean(String key) async {
    String? value = await _storage.read(key: key);
    return value == 'true';
  }

  @override
  Future<int?> getInt(String key) async {
    String? value = await _storage.read(key: key);
    return value != null ? int.tryParse(value) : null;
  }

  @override
  Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  // ValueNotifier to hold the current club category id
  ValueNotifier<int> clubCategoryIdNotifier2 = ValueNotifier<int>(1);
  @override
  ValueNotifier<int> get clubCategoryIdNotifier => clubCategoryIdNotifier2;

  @override
  Future<void> saveClubCategoryId(int id) async {
    await setInt('club_category_id', id);
  }

  @override
  Future<int> getClubCategoryId() async {
    return await getInt('club_category_id') ?? 1;
  }

  // ValueNotifier to hold the current club category type
  ValueNotifier<int> clubBusinessModelTypeNotifier2 = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get clubBusinessModelTypeNotifier =>
      clubBusinessModelTypeNotifier2;

  @override
  Future<void> saveBusinessModelType(int id) async {
    await setInt('business_model_type', id);
  }

  @override
  Future<int> getBusinessModelType() async {
    return await getInt('business_model_type') ?? 0;
  }

  @override
  Future<void> saveClubCategoryName(String name) async {
    await setString('club_category_name', name);
  }

  @override
  Future<String> getClubCategoryName() async {
    return await getString('club_category_name') ?? 'tennis';
  }

  @override
  Future<void> saveClubCategories(
    List<ClubCategoryCacheModel> categories,
  ) async {
    final jsonString = ClubCategoryCacheModel.toJsonList(categories);
    await setString(_clubCategoriesKey, jsonString);
  }

  @override
  Future<ClubCategoryCacheModel?> getClubCategoryBySeoName(
    String seoName,
  ) async {
    final categories = await getClubCategories();
    return categories.firstWhere(
      (cat) => cat.seoName == seoName.replaceAll('/', ''),
      orElse:
          () => ClubCategoryCacheModel(
            id: 1,
            seoName: 'tennis',
            businessModelType: 0,
          ),
    );
  }

  @override
  Future<List<ClubCategoryCacheModel>> getClubCategories() async {
    final jsonString = await getString(_clubCategoriesKey);
    if (jsonString == null) return [];
    return ClubCategoryCacheModel.fromJsonList(jsonString);
  }
}
