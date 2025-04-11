import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return SizedBox(

      child:
          DecoratedBox(decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xFFd8e2f9),
                  Color(0xFFBCCBFF),
                  Colors.lightBlueAccent
                ],
              ),
              borderRadius: BorderRadius.circular(10)),child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(localization.verifyyouremailaddress),
                Text(
                  localization
                      .pleaseverifyyouremailadresssoitcanhelpyouinfuturetochangeyourphonenumberlikewisewewillsendyouimplrtnotificationviaemail,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent.withOpacity(0.1),
                        border: Border.all(color: Colors.orange.withOpacity(0.3))),
                    child: Center(
                        child: Text(
                          localization.verifynow,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                  ),
                )
              ],
            ),
          ),)

    );
  }
}
