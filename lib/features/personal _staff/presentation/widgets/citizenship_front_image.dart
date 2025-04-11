import 'dart:io';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class StaffCitizenshipFrontImage extends StatelessWidget {
  final File? citizenFrontImage; // Accept the image file
  final Function(ImageSource) pickCitizenFrontImage; // Accept the image picker function

  const StaffCitizenshipFrontImage({
    super.key,
    required this.citizenFrontImage,
    required this.pickCitizenFrontImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: GestureDetector(
        onTap: () => showImagePickerDialog(
            context, pickCitizenFrontImage), // Call the passed function
        child: SizedBox(
          height: 80.h,
          width: 80.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: citizenFrontImage != null
                ? Image.file(
              citizenFrontImage!,
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
