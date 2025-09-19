import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/tasks_provider.dart';
import '../widgets/appbar.dart';

class MainPage extends StatefulWidget {
  static final route = '/main';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: SizedBox(
                      width: 400.w,
                      child: Card(
                        color: colors['background'],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                        ),
                        child: taskProvider.tasks.isNotEmpty
                            ? ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 30.h,
                                ),
                                itemCount: taskProvider.tasks.length,
                                itemBuilder: (context, index) {
                                  final task = taskProvider.tasks[index];
                                  return ListTile(
                                    title: Text(
                                      task.title,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20.sp,
                                        color: task.isDone
                                            ? colors['done']
                                            : Colors.black,
                                        decoration: task.isDone
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    leading: IconButton(
                                      onPressed: () {
                                        taskProvider.removeTask(index);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: colors['delete'],
                                        size: 30.sp,
                                      ),
                                    ),
                                    trailing: Checkbox(
                                      value: task.isDone,
                                      onChanged: (_) =>
                                          taskProvider.checkTask(index),
                                      checkColor: Colors.white,
                                      activeColor: colors['done'],
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'There is nothing to show . . .',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: colors['not_done'],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 150.w,
        child: FittedBox(
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.r),
            ),
            backgroundColor: colors['add'],
            label: Text(
              'Add',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.add,
              size: 22.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
