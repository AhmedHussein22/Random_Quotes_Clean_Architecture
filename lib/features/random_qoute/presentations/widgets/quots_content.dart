import 'package:flutter/material.dart';
import 'package:random_qutos/features/random_qoute/domain/entities/qoutes.dart';


import '../../../../core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key, required this.quote});

  final Qoutes quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(quote.msg, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text("quote.author", style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
