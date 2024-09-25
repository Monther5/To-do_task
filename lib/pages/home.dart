import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/models/task_model.dart';
import 'package:todo_task/provaders/darkMode.dart';
import 'package:todo_task/provaders/provader.dart';
import 'package:todo_task/provaders/provider_Lang.dart';
import 'package:todo_task/widgets/add_dialog.dart';
import 'package:todo_task/widgets/drower.dart';
import 'package:todo_task/widgets/task_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskSubtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<darkmodeprovider>(builder: (context, darkModeConsumer, _) {
      return Consumer<TasksProvider>(builder: (context, tasksConsumer, _) {
      
            return Scaffold(
                drawer: Drawer(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          DrawerTile(
                              text: darkModeConsumer.isdark
                                  ? 
                             AppLocalizations.of(context )!.darkmode: AppLocalizations.of(context )!.lightmode  ,   
                              onTab: () {
                                Provider.of<darkmodeprovider>(context,
                                        listen: false)
                                    .switchmoder();
                              },
                              icon: darkModeConsumer.isdark
                                  ? Icons.light_mode
                                  : Icons.dark_mode),
                                 
                                      
                             
                                  DrawerTile(text: "Arabic", onTab: (){
                                    Provider.of<LangProvider>(context, listen: false).changeLanguage("ar");
                                  }
            
                                  
                                  
                                  , icon: Icons.language),
                                   DrawerTile(text: "es", onTab: (){
                                    Provider.of<LangProvider>(context, listen: false).changeLanguage("es");
                                  }
            
                                  
                                  
                                  , icon: Icons.language),
                                   DrawerTile(text: "Engalsh", onTab: (){
                                    Provider.of<LangProvider>(context, listen: false).changeLanguage("en");
                                  }
            
                                  
                                  
                                  , icon: Icons.language),

                                
                                
                                  
            
                        ],
                      ),
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddTaskDialog(
                                titleController: taskTitleController,
                                subTitleController: taskSubtitleController,
                                onTap: () {
                                  Provider.of<TasksProvider>(context, listen: false)
                                      .addTask(Taskmodel(
                                          title: taskTitleController.text,
                 subtitle:
                                              taskSubtitleController.text.isEmpty
                                                  ? null
                                                  : taskSubtitleController.text,                                     
                                           ));
                                  taskTitleController.clear();
                                  taskSubtitleController.clear();
                                  Navigator.pop(context);
                                });
                          });
                    }),
                appBar: AppBar(
                  title:  Text(AppLocalizations.of(context )!.title)
                ),
                body: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                          isScrollable: false,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(
                              text:  AppLocalizations.of(context )!.waiting,
                            ),
                            Tab(
                              text:  AppLocalizations.of(context )!.completed,
                            )
                          ]),
                      Expanded(
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ListView.builder(
                                padding: const EdgeInsets.all(24),
                                itemCount: tasksConsumer.tasks.length,
                                itemBuilder: (context, index) {
                                  return tasksConsumer.tasks[index].isCompleted
                                      ? const SizedBox()
                                      : TaskCard(
                                          taskModel: tasksConsumer.tasks[index],
                                          onTap: () {
                                            Provider.of<TasksProvider>(context,
                                                    listen: false)
                                                .switchValue(
                                                    tasksConsumer.tasks[index]);
                                          }, onTapForCheck: () {  },);
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.all(24),
                                itemCount: tasksConsumer.tasks.length,
                                itemBuilder: (context, index) {
                                  return !tasksConsumer.tasks[index].isCompleted
                                      ? const SizedBox()
                                      : TaskCard(
                                          taskModel: tasksConsumer.tasks[index],
                                          onTap: () {
                                            Provider.of<TasksProvider>(context,
                                                    listen: false)
                                                .switchValue(
                                                    tasksConsumer.tasks[index]);
                                          }, onTapForCheck: () {  },);
                                },
                              ),
                            ]),
                      )
                    ],
                  ),
                ));
          }
        );
      });
   
  }
}