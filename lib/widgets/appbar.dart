import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        'TODO',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 40.sp,
            color: colors['not_done'],
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size(426.w, 50.h);
}
