import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/shared_strings.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;

  LangLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async => await sharedPreferences.setString(AppStrings.appLanguage, langCode);

  @override
  Future<String> getSavedLang() async => sharedPreferences.containsKey(AppStrings.appLanguage) ? sharedPreferences.getString(AppStrings.appLanguage)! : AppStrings.englishCode;
}
