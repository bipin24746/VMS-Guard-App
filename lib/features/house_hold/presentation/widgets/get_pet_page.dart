import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/add_pet_button.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GetPetPage extends StatefulWidget {

  const GetPetPage({super.key});

  @override
  State<GetPetPage> createState() => _GetPetPageState();
}

class _GetPetPageState extends State<GetPetPage> {




  void _petPopUp(BuildContext context, dynamic pet) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final localization = AppLocalizations.of(context)!;
        return BlocProvider<PetBloc>(
          create: (context) => sl<PetBloc>(), // Providing PetBloc to this BottomSheet
          child: Builder(builder: (contextPet) {
            return BlocListener<PetBloc, PetState>(
              listener: (context, state) {
                if (state is PetDeleteSuccess) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(localization.petdeletedsuccessfully),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is PetFailure) {
                  log("${localization.error}: ${state.error}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${localization.failedtodeletepet}: ${state.error}"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        pet.name, // Access name property directly
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        backgroundImage: pet.imageUrl != null && pet.imageUrl!.isNotEmpty
                            ? CachedNetworkImageProvider(pet.imageUrl!)
                            : null,
                        child: pet.imageUrl == null || pet.imageUrl!.isEmpty
                            ? Text(
                          pet.name.isNotEmpty
                              ? pet.name[0].toUpperCase()
                              : 'N',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                            : null,
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text(
                          pet.typee, // Access type property directly
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      pet.name, // Access noPlate property directly
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pet.breed),
                        Text("${pet.age} ${localization.monthsold}"),
                        Text(pet.gender),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(EditPetPageRoute(pet: pet));
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.orangeAccent),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    localization.edit,
                                    style: TextStyle(color: Colors.orangeAccent),
                                  ),
                                  Icon(Icons.edit, color: Colors.orangeAccent),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Show the confirmation dialog when the user taps "Remove"
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      localization.removepet,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    content: Text(
                                      localization.areyousureyouwanttoremovethispet,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Close the dialog
                                        },
                                        child: Text(localization.no),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          contextPet.read<PetBloc>().add(DeletePetEvent(petId: pet.id));
                                          AutoRouter.of(context).push(HouseHoldMainRoute());
                                          Navigator.of(context).pop(); // Close the dialog
                                        },
                                        child: Text(localization.yes),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.redAccent),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    localization.remove,
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                  Icon(Icons.delete, color: Colors.redAccent),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<PetBloc>()..add(FetchPetEvent()),
      child: BlocListener<PetBloc, PetState>(
        listener: (context, state) {
          if (state is PetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localization.petsfetchedsuccessfully),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is PetFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${localization.error}: ${state.error}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<PetBloc, PetState>(
          builder: (context, state) {
            if (state is PetLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PetFetchSuccess) {
              if (state.pet.isEmpty) {
                return Center(child: Text(localization.nopetsavailable));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    children: List.generate(state.pet.length + 1, (index) {
                      if (index == state.pet.length) {
                        return PetCreateButton();
                      } else {
                        final pet = state.pet[index];
                        return GestureDetector(
                          onTap: () {
                            _petPopUp(context, pet);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: CircleAvatar(
                                    radius: 23,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: pet.imageUrl != null
                                        ? NetworkImage(pet.imageUrl!)
                                        : null,
                                  ),
                                ),
                                Text(
                                  pet.breed,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                    child: Text(
                                      pet.name, // Display pet name
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }).reversed.toList(),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PetCreateButton(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
