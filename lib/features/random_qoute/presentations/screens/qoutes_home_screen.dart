import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_qutos/features/random_qoute/presentations/cubits/random_quote_cubit.dart';
import 'package:random_qutos/features/random_qoute/presentations/cubits/random_quote_state.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/shared_widgets/error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../splash/presentation/bloc/locale_bloc.dart';
import '../widgets/quots_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  

   _getRandomQuote() => BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return const Center(
            child:  CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteError) {
          return  OnErrorWidget(
            errorMsg: state.errormsg,
            onPress:()=> _getRandomQuote(),
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuoteContent(
                quote: state.quote,
              ),
              InkWell(
                   onTap: () => _getRandomQuote(),
                  child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
                child: const Icon(
                  Icons.refresh,
                  size: 28,
                  color: Colors.white,
                ),
              ))
            ],
          );
        } else {
          return const CircularProgressIndicator.adaptive(backgroundColor: AppColors.primary);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.translate_outlined,
          color: AppColors.primary,
        ),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
      ),
       title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      
    );
    return Scaffold(appBar: appBar, body: _buildBodyContent());
  }
}
