import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/providers/tasks_provider.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';

class AddTaskPage extends StatefulWidget {
  static final String route = '/add';
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: TextField(
              controller: _controller,
              maxLength: 30,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.abc,
                  color: Colors.transparent,
                ),
                hint: Text(
                  'What do you need to do?',
                  style: GoogleFonts.poppins(color: colors['not_done']),
                ),
                filled: true,
                fillColor: colors['background'],
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              children: [
                MaterialButton(
                  elevation: 0,
                  color: colors['delete'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0.r),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                MaterialButton(
                  elevation: 0,
                  color: colors['add'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0.r),
                    child: Text(
                      'ADD',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _controller.text != ''
                        ? Provider.of<TaskProvider>(
                            context,
                            listen: false,
                          ).addTask(
                            Tasks(title: _controller.text, isDone: false),
                          )
                        : null;
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
