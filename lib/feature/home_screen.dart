import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/cubits/home_cubit.dart';
import 'package:flutter_application_1/feature/cubits/state.dart';
import 'package:flutter_application_1/feature/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatefulWidget {
  const PageOne({required super.key,});
  @override
  State<PageOne> createState() => _PageOneState();

  
}

class _PageOneState extends State<PageOne> {
   TextEditingController emailcontroller = TextEditingController();
    TextEditingController agecontroller=TextEditingController();
 @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    agecontroller = TextEditingController();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
            
             hintText: 'Enter your name',
             labelText: 'Name',
             border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15),
             
          ),
          ),
          ),
          SizedBox(height: 30,),
          TextField(
            controller: agecontroller,
            decoration: InputDecoration(
            
             hintText: 'Enter your age',
             labelText: 'age',
             border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15),
             
          ),
          ),
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                context.read<HomeScreenCubit>().addUser(UserModel(age: agecontroller.text, name: emailcontroller.text));
              }, child:Text("add")),
              TextButton(onPressed: (){
                context.read<HomeScreenCubit>().getUser();
              }, child:Text("get")),
               TextButton(onPressed: (){
                context.read<HomeScreenCubit>().deleteUser();
               }
               , child:Text("delete")),
               
            ],
            
          ),
           BlocBuilder<HomeScreenCubit, HomeScreenState>(
  builder: (context, state) {
    if (state is HomeGetSucssess) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(state.model.name),
          Text(state.model.age),
        ],
      );
    }

    if (state is HomeScreenEroor) {
      return Text(state.massege);
    }

    if (state is HomeScreenLoading) {
      return const CircularProgressIndicator();
    }

    return const SizedBox.shrink();
  },
)
        ]
      )
      
    );
    
  }
}