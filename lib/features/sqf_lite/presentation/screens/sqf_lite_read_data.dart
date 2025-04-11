import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_bloc.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_event.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_state.dart';
import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@RoutePage()
class SqfLiteReadData extends StatelessWidget {
  const SqfLiteReadData({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).replace(SqfAddScreenRoute());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(localization.alllocaldata),
        ),
        body: BlocProvider(

          create: (context) => sl<SqfLiteBloc>()..add(ReadDataEvent()),
          child: BlocBuilder<SqfLiteBloc, SqfLiteState>(
            builder: (context, state) {
              if (state is SqfLiteLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SqfLiteFetchSuccess) {
                if (state.data.isEmpty) {
                  return Center(child: Text(localization.nodataavailable));
                }
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final item = state.data[index];
                    return ListTile(

                      title: Text(item.name),
                      subtitle: Text(item.age.toString()),

                      trailing: Row(

                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            onPressed: () {
                              AutoRouter.of(context).push(
                                SqfUpdateScreenRoute(
                                  modelClass: SqfLiteModel(
                                    id: item.id,
                                    name: item.name,
                                    age: item.age,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.blue),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<SqfLiteBloc>()
                                  .add(DeleteDataEvent(item.id!));
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return Center(child: Text(localization.errorloadingdata));
            },
          ),
        ),
      ),
    );
  }
}
