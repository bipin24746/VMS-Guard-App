import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/screen/edit_pet_form.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditPetPage extends StatefulWidget {
  final PetEntity pet;
  const EditPetPage({super.key, required this.pet});

  @override
  State<EditPetPage> createState() => _EditPetPageState();
}

class _EditPetPageState extends State<EditPetPage> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<PetBloc>(),
      child: Builder(
        builder: (context) {
          return BlocListener<PetBloc, PetState>(
            listener: (context, state) {
              if (state is PetEditSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: Text(localization.petseditedsuccessully),
                    backgroundColor: Colors.green,
                  ),
                );
                AutoRouter.of(context).push(HouseHoldMainRoute());
              } else if (state is PetFailure) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${localization.error}: ${state.error}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: EditPetForm(pet: widget.pet,),
          );
        }
      ),
    );
  }
}