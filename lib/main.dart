import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  Bloc.observer = AppBlocObserver();
  runApp(const QuoteApp());
}
