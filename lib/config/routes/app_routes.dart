import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_qutos/features/random_qoute/presentations/cubits/random_quote_cubit.dart';
import 'package:random_qutos/features/random_qoute/presentations/screens/qoutes_home_screen.dart';

import '../../core/utils/shared_strings.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RandomQuoteCubit>(
            create: (context) => sl<RandomQuoteCubit>(),
            child: const QuoteScreen(),
          ),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
