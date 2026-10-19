import 'package:flutter_application_1/feature/models/user_model.dart';

sealed class HomeScreenState{}
class HomeScreenIntial extends HomeScreenState{}
class HomeScreenLoading extends HomeScreenState{}
class HomeScreenEroor extends HomeScreenState{
  final String massege;
  HomeScreenEroor({required this.massege});

}
class HomeAddSucssess extends HomeScreenState{}
class HomeGetSucssess extends HomeScreenState{
  final UserModel model;
  HomeGetSucssess ({required this.model});

}
class HomeDeleteSucssess extends HomeScreenState{}
