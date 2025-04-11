import 'dart:io';

import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StaffCitizenshipBackImage extends StatelessWidget {
  final File? citizenBackImage;
  final Function(ImageSource) pickCitizenBackImage;
  const StaffCitizenshipBackImage({super.key, this.citizenBackImage, required this.pickCitizenBackImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => showImagePickerDialog(
            context, pickCitizenBackImage),
        child: SizedBox(
          height: 80,
          width: 80,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: citizenBackImage != null
                ? Image.file(
              citizenBackImage!,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            )
                : const Icon(
              Icons.image,
              color: Colors.orange,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
