import 'package:flutter/material.dart';
import 'screens/add_task_page.dart';
import 'screens/main_page.dart';

Map<String, WidgetBuilder> routes = {
  MainPage.route: (BuildContext context) => MainPage(),
  AddTaskPage.route: (BuildContext context) => AddTaskPage(),
};
