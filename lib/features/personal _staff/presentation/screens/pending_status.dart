import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/bloc/personal_staff_bloc/personal_staff_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PendingStatus extends StatelessWidget {
  const PendingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
      sl<PersonalStaffBloc>()..add(FetchPendingStaffEvent()),
      child: BlocListener<PersonalStaffBloc, PersonalStaffState>(
        listener: (context, state) {
          if (state is PersonalStaffSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localization.pendingstafffetchsuccessfully),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is PersonalStaffFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${localization.error}: ${state.error}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<PersonalStaffBloc, PersonalStaffState>(
          builder: (context, state) {
            if (state is PersonalStaffLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PendingStaffFetchSuccess) {
              if (state.pendingStaff.isEmpty) {
                return Center(child: Text(localization.nopendingstaffs));
              }

              return ListView.builder(
                itemCount: state.pendingStaff.length,
                itemBuilder: (context, index) {
                  final staff = state.pendingStaff[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // CircleAvatar with fallback image
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: staff.profileUrl != null && staff.profileUrl!.isNotEmpty
                                    ? NetworkImage(staff.profileUrl!)
                                    : AssetImage(
                                    'lib/assets/images/Photu.jpg')
                                as ImageProvider,
                              ),
                              // Profile Image or Placeholder
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(staff.name.isNotEmpty
                                        ? staff.name
                                        : localization.unknownname),
                                    SizedBox(height: 5,),
                                    SizedBox(
                                      width: 100,
                                      height: 25,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text(
                                            // Now access the name from staffRoleId, which is an instance of PersonalStaffRoleModel
                                            staff.staffRoleId.name.isNotEmpty == true
                                                ? staff.staffRoleId.name
                                                : localization.norole,
                                            // Display role name
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_right),
                            ],
                          ),
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),
                  );
                },
              );
            }

            return const SizedBox(); // Return empty size if the state is not handled
          },
        ),
      ),
    );
  }
}
