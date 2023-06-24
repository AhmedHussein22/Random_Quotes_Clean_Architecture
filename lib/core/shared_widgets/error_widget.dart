import 'package:flutter/material.dart';

import '../../config/locale/app_localizations.dart';
import '../utils/app_colors.dart';

class OnErrorWidget extends StatelessWidget {
  final String? errorMsg;
  final VoidCallback? onPress;
  const OnErrorWidget({Key? key, this.onPress, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            //"something_went_wrong",
            errorMsg??
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          //"try_again",
          AppLocalizations.of(context)!.translate('try_again')!,
          style: const TextStyle(color: AppColors.hint, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          height: 55,
          // width: 100,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: AppColors.primary, onPrimary: Theme.of(context).primaryColor, elevation: 500, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
            child: Text(
              AppLocalizations.of(context)!.translate('reload_screen')!,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
