import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/pages/home.dart';
import 'package:todo_task/provaders/darkMode.dart';
import 'package:todo_task/provaders/provader.dart';
import 'package:todo_task/provaders/provider_Lang.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        ChangeNotifierProvider<LangProvider>(create: (context)=>LangProvider()..getLanguage()),
      ],

      
      child:  Consumer<LangProvider>(
        builder: (context,langpcasumer, _) {
          return Consumer<darkmodeprovider>(
            builder: (context,darkMode,_) {
              return MaterialApp(
                locale:Locale(
                                    langpcasumer.language                  

                  
                ) ,
                 localizationsDelegates: const [
                      AppLocalizations.delegate, 
          
          
            GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar',), 
              Locale('en'), // English
              Locale('es'), // Spanish
            ],
                                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                 dividerTheme: DividerThemeData(
                  color: darkMode.isdark?Colors.purple:Colors.yellow,
                 ),
                 tabBarTheme: TabBarTheme(
                  labelColor:  darkMode.isdark?Colors.white:Colors.purple,
                 ),
                 appBarTheme: AppBarTheme(
                  centerTitle: true,backgroundColor: Colors.purple,
          
                 ),
                 drawerTheme: DrawerThemeData(
                  backgroundColor:darkMode.isdark?Colors.white:Colors.purple,
          
                  
                 ),
                 scaffoldBackgroundColor: 
                 darkMode.isdark?Colors.black:Colors.white,
          
                ),
                
                home: 
                 HomeScreen(),
              );
            }
          );
        }
      ),
    );
  }
}