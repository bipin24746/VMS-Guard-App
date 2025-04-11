import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_bloc.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_event.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_state.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SqfUpdateScreen extends StatefulWidget {
  final SqfLiteModel modelClass;

  const SqfUpdateScreen({Key? key, required this.modelClass}) : super(key: key);

  @override
  _SqfUpdateScreenState createState() => _SqfUpdateScreenState();
}

class _SqfUpdateScreenState extends State<SqfUpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.modelClass.name);
    ageController =
        TextEditingController(text: widget.modelClass.age.toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.updatadata,),
      ),
      body: BlocProvider(
        create: (context) => sl<SqfLiteBloc>(),
        child: BlocBuilder<SqfLiteBloc, SqfLiteState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: localization.entername,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: localization.enterage,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty) {
                        final update = SqfLiteModel(
                          id: widget.modelClass.id,
                          name: nameController.text,
                          age: int.parse(ageController.text),
                        );
                        context.read<SqfLiteBloc>().add(UpdateDataEvent(
                            id: update.id!,
                            name: update.name,
                            age: update.age));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(localization.dataupdated,)),
                        );

                        AutoRouter.of(context).push(SqfLiteReadDataRoute());
                      }
                    },
                    child: Text(localization.update),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
