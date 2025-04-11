import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/widgets/flat_info_container.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';


class FlatInfoRow extends StatelessWidget {
  final Data data;

  const FlatInfoRow({required this.data});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final block = data.floor?.block;
    return Row(
      children: [
        FlatInfoContainer(
          icon: 'lib/assets/images/red_building.png',
          label: block?.name ?? localization.unknownblock,
        ),
        const SizedBox(width: 10),
        FlatInfoContainer(
          icon: 'lib/assets/images/house.png',
          label: data.name ?? "Unknown Flat Number",
        ),
      ],
    );
  }
}
