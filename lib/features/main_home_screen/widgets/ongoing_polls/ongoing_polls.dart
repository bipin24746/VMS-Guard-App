import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class OngoingPollsHome extends StatelessWidget {
  const OngoingPollsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.lightGreenAccent,
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      localization.ongoingpolls,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      localization.viewall,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_right),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(

              width: MediaQuery.of(context).size.width,

              child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localization
                          .helloeveryonewearegoingtoorganizefutsalincomingsaturday,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      localization.nov1620231020am,
                      style: TextStyle(fontSize: 15),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.lightGreenAccent,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 15, bottom: 8),
                        child: Text(
                          localization.yes,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 15, bottom: 8),
                        child: Text(
                          localization.no,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueGrey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                              localization.vote,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(

                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      localization.totalresponse,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      localization.three,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      localization.pollendsin,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      localization.fivehr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),)
            )
          ],
        ),
      ),
    );
  }
}
