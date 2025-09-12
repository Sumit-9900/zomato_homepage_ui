import 'package:flutter/services.dart';
import 'package:zomato_ui/core/constants/app_constants.dart';
import 'package:zomato_ui/features/home/models/biryani_model.dart';

abstract interface class HomeLocalRepository {
  Future<BiryaniModel> loadLocalJson();
}

class HomeLocalRepositoryImpl implements HomeLocalRepository {
  @override
  Future<BiryaniModel> loadLocalJson() async {
    try {
      final jsonString = await rootBundle.loadString(AppConstants.mockJsonPath);
      final biryanis = BiryaniModel.fromRawJson(jsonString);
      return biryanis;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
