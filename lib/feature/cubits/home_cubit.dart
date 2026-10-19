import 'package:flutter_application_1/core/datasourse/hive_data_sourse.dart';
import 'package:flutter_application_1/feature/cubits/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/feature/models/user_model.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
HomeScreenCubit():super(HomeScreenIntial());
HiveDataSourse hiveObjct =HiveDataSourse();
Future<void>addUser(UserModel userData)
async{
  emit(HomeScreenLoading());
  try {
   await hiveObjct.createUser(userData);
   emit(HomeAddSucssess());
  }
  catch (error){
    emit(HomeScreenEroor(massege: error.toString()));
    
  }
}
void getUser(){
try{
  UserModel model=hiveObjct.getUser();
  emit(HomeGetSucssess(model: model));
}
catch(error){
  emit(HomeScreenEroor(massege: error.toString()));
}
}
Future<void>deleteUser()
async{
  emit(HomeScreenLoading());
  emit(HomeScreenLoading());
  try {
   await hiveObjct.deleteUser(UserModel(age: 'age', name: 'name'));
   emit(HomeDeleteSucssess());
  }
  catch (error){
    emit(HomeScreenEroor(massege: error.toString()));
    
  }
}
}