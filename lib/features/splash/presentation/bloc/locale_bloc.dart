import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_qutos/features/splash/presentation/bloc/locale_state.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/shared_strings.dart';
import '../../domain/usecases/change_lang.dart';
import '../../domain/usecases/get_saved_lang.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  LocaleCubit({required this.getSavedLangUseCase, required this.changeLangUseCase}) : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
