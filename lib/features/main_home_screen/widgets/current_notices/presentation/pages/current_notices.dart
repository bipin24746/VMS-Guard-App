import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/l10n/l10n.dart';

import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/integration.dart';
import '../bloc/notice_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CurrentNoticeHome extends StatelessWidget {
  const CurrentNoticeHome({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocBuilder<NoticeBloc, NoticeState>(
      builder: (context, state) {
        if (state is NoticeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NoticeLoaded) {
          // debugPrint("Notices received: ${state.notices.data.length}");
          return _buildNoticesList(state.notices, context);
        } else if (state is NoticeError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(localization.nonoticesavailable));
        }
      },
    );
  }

  Widget _buildNoticesList(Integration notices, BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    bool isExpanded = false;
    if (notices.data == null || notices.data.isEmpty) {
      // debugPrint("No notices found!");
      return Center(child: Text(localization.nonoticesavailable));
    }

    // Calculate height dynamically based on the number of notices
    double containerHeight = notices.data.length *
        270.0; // Adjust item height (200) and extra padding (100)

    return Container(
      height: containerHeight, // Set dynamic height
      color: Colors.orangeAccent.withOpacity(0.1),
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
                      localization.currentnotices,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(AllNoticesCleanRoute());
                  },
                  child: Row(
                    children: [
                      Text(
                        localization.viewall,
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notices.data.length,
                itemBuilder: (context, index) {
                  final notice = notices.data[index];

                  // Format the createdAt field using the DateFormat class
                  String formattedDate =
                      DateFormat(localization.mmddyyyy).format(notice.createdAt);
                  String formattedTime =
                      DateFormat(localization.hhmma).format(notice.createdAt);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200, // Fixed height per item
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 25, right: 25),
                                child: Text(
                                  notice.category,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notice.title,
                                  maxLines: 3, // Expand on Read More
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Text(
                                        formattedDate), // Display formatted date
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                          formattedTime), // Display formatted time
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.orangeAccent.withOpacity(0.3),
                                ),
                                Text(
                                  notice.message,
                                  maxLines: isExpanded ? null : 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isExpanded = !isExpanded;
                                  },
                                  child: Text(
                                    isExpanded ? localization.readless : localization.readmore,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
