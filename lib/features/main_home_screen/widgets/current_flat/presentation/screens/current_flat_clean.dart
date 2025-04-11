import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/bloc/current_flat_bloc.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/widgets/flat_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentFlatClean extends StatelessWidget {
  const CurrentFlatClean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentFlatBloc, CurrentFlatState>(
      builder: (context, state) {
        if (state is CurrentFlatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CurrentFlatLoaded) {
          debugPrint("Flat: ${state.currentFlatIntegration.data.name}");
          return FlatContainer(currentFlatIntegration: state.currentFlatIntegration);
        } else if (state is CurrentFlatError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No flats available'));
        }
      },
    );
  }
}





// import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/bloc/current_flat_bloc.dart';
//
// class CurrentFlatClean extends StatelessWidget {
//   const CurrentFlatClean({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CurrentFlatBloc, CurrentFlatState>(
//       builder: (context, state) {
//         if (state is CurrentFlatLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is CurrentFlatLoaded) {
//           debugPrint("Flat: ${state.currentFlatIntegration.data.name}");
//           return _buildCurrentFlat(state.currentFlatIntegration, context);
//         } else if (state is CurrentFlatError) {
//           return Center(child: Text(state.message));
//         } else {
//           return const Center(child: Text('No flats available'));
//         }
//       },
//     );
//   }
//
//   Widget _buildCurrentFlat(
//       CurrentFlatIntegration currentFlatIntegration, context) {
//     // Check if data is null, show an appropriate message
//     if (currentFlatIntegration.data == null) {
//       debugPrint("No flat found!");
//       return const Center(child: Text('No flat available'));
//     }
//
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         child: Container(
//           height: 200,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Colors.white30,
//             border: Border.all(),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Your apartment",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Divider(
//                   thickness: 2,
//                   color: Colors.blueGrey.withOpacity(0.3),
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       height: 90,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Safely access the data and its properties
//                             Text(
//                               currentFlatIntegration
//                                       .data?.floor?.block?.apartment?.name ??
//                                   'Unknown Apartment',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   currentFlatIntegration.data?.floor?.block
//                                           ?.apartment?.area ??
//                                       'Unknown area',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text(
//                                   currentFlatIntegration.data?.floor?.block
//                                           ?.apartment?.city ??
//                                       'Unknown city',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 10,
//                       child: Image.asset(
//                         'lib/assets/images/flat_buildings.png',
//                         width: 50,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Container(
//                       height: 30,
//                       width: 120,
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset('lib/assets/images/red_building.png',
//                               width: 40),
//                           Text(
//                             currentFlatIntegration.data?.floor?.block?.name ??
//                                 'Unknown Block',
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Container(
//                       height: 30,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset('lib/assets/images/house.png', width: 40),
//                           Text(
//                             currentFlatIntegration.data?.name ??
//                                 "Unknown Flat Number",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
