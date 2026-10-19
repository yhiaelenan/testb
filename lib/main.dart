import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/cubits/home_cubit.dart';
import 'package:flutter_application_1/feature/home_screen.dart';
import 'package:flutter_application_1/feature/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: BlocProvider(
    create: (context) => HomeScreenCubit(),
    child:  PageOne(key: null,),
  ),
);
  }
}
