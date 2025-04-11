import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/screen/pet_form.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<PetBloc>(),
      child: BlocListener<PetBloc, PetState>(
        listener: (context, state) {
          if (state is PetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localization.petsaddedsuccessfully),
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
        child: PetForm(),
      ),
    );
  }
}
