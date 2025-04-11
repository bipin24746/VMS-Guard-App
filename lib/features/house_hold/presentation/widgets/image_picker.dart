import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> showImagePickerDialog(
    BuildContext context, Function(ImageSource) onPickImage) {
  final localization = AppLocalizations.of(context)!;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:  Text(localization.chooseanoption),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title:  Text(localization.opencamera),
                onTap: () {
                  Navigator.pop(context);
                  onPickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title:  Text(localization.opengallery),
                onTap: () {
                  Navigator.pop(context);
                  onPickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
