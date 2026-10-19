import 'package:flutter_application_1/feature/models/user_model.dart';
import 'package:hive/hive.dart';

class HiveDataSourse {
  final Box _box =Hive.box("userData") ;
  Future<void>createUser(UserModel userData)async{
    await _box.put('user', userData);
  }
  UserModel getUser(){
    return _box.get('user');
  }
   Future<void>deleteUser(UserModel userData)async{
    await _box.delete('user');
  }
}