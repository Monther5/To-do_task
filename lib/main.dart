import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/pages/home.dart';
import 'package:todo_task/provaders/darkMode.dart';
import 'package:todo_task/provaders/provader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksProvider>(
          create: (context) => TasksProvider(),
          
        ),
        ChangeNotifierProvider<darkmodeprovider>(create: (context) => darkmodeprovider(),),
      ],

      
      child:  Consumer<darkmodeprovider>(
        builder: (context,darkMode,_) {
          return MaterialApp(
            
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
             dividerTheme: DividerThemeData(
              color: darkMode.isdark?Colors.white:Colors.black,
             ),
             tabBarTheme: TabBarTheme(
              labelColor:  darkMode.isdark?Colors.white:Colors.black,
             ),
             appBarTheme: AppBarTheme(
              centerTitle: true,backgroundColor: Colors.black,

             ),
             drawerTheme: DrawerThemeData(
              backgroundColor:darkMode.isdark?Colors.white:Colors.black,

              
             ),
             scaffoldBackgroundColor: 
             darkMode.isdark?Colors.black:Colors.white,

            ),
            
            home: 
             HomeScreen(),
          );
        }
      ),
    );
  }
}