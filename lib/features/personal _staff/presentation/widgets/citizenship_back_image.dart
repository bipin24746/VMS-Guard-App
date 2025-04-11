import 'dart:io';

import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class StaffCitizenshipBackImage extends StatelessWidget {
  final File? citizenBackImage;
  final Function(ImageSource) pickCitizenBackImage;
  const StaffCitizenshipBackImage({super.key, this.citizenBackImage, required this.pickCitizenBackImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: GestureDetector(
        onTap: () => showImagePickerDialog(
            context, pickCitizenBackImage),
        child: SizedBox(
          height: 80.h,
          width: 80.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: citizenBackImage != null
                ? Image.file(
              citizenBackImage!,
              fit: BoxFit.cover,
              width: 80.0.w,
              height: 80.0.h,
            )
                :  Icon(
              Icons.image,
              color: Colors.orange,
              size: 40.sp,
            ),
          ),
        ),
      ),
    );
  }
}
