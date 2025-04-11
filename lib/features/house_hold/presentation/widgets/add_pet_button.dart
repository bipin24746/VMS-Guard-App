import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class PetCreateButton extends StatelessWidget {
  const PetCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
   final localization = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(
          AddPetPageRoute(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.lightBlueAccent, Colors.white],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(Icons.add, color: Colors.white, size: 30),
              const SizedBox(height: 5),
              Text(
                localization.addpet
               ,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // Adjusted font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
