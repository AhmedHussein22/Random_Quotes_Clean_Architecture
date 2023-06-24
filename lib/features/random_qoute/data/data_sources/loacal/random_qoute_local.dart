import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/shared_strings.dart';
import '../../models/qoute_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote = Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(AppStrings.cachedRandomQuote, quote.toString());
  }
}
