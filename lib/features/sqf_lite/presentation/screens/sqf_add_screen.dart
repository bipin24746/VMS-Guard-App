import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_bloc.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_event.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_state.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SqfAddScreen extends StatelessWidget {
  SqfAddScreen({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          AutoRouter.of(context).replace(HomeScreenMainRoute());
          return false;
        },
        child: BlocProvider(
          create: (context) => sl<SqfLiteBloc>(),
          child: BlocBuilder<SqfLiteBloc, SqfLiteState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("SQLite Database"),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Enter name"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Enter age",
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              final item = SqfLiteModel(
                                age: int.parse(ageController.text),
                                name: nameController.text,
                              );
                              context.read<SqfLiteBloc>().add(AddDataEvent(name: item.name, age: item.age));
                              nameController.clear();
                              ageController.clear();
                            },
                            child: Text("Insert"),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {

                              AutoRouter.of(context).push(SqfLiteReadDataRoute());
                            },
                            child: Text("Read Data"),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
