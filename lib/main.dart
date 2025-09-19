import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final taskProvider = TaskProvider();
  await taskProvider.loadTasks();

  runApp(
    ScreenUtilInit(
      designSize: Size(428, 926),
      child: ChangeNotifierProvider(
        create: (_) => taskProvider,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: routes,
    );
  }
}
