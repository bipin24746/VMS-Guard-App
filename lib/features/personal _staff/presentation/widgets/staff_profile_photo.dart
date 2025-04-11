import 'dart:io';

import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_image_picker.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StaffProfilePhoto extends StatelessWidget {
  final File? profileImage;
  final Function(ImageSource) onPickImage;

  const StaffProfilePhoto({
    super.key,
    required this.profileImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Row(
      children: [
        GestureDetector(
          onTap: () => showImagePickerDialog(context, onPickImage),
          child: Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Display profile image or default icon
                profileImage != null
                    ? ClipOval(
                        child: Image.file(
                          profileImage!,
                          fit: BoxFit.cover,
                          width: 90.0,
                          height: 90.0,
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.orange,
                        size: 40,
                      ),
                // Positioned image icon
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.orange, width: 1),
                    ),
                    child: const Icon(
                      Icons.image,
                      color: Colors.orange,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: DecoratedBox(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      localization.addphoto,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                   Text(
                    localization.photorequiredforeasystaffverficationbyguardandmanagement,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
