import 'package:flutter/material.dart';

class AddContactDetails extends StatelessWidget {
  final String contactLetter;
  final String contactName;
  final String contactPhone;
  const AddContactDetails({
    super.key,
    required this.contactLetter,
    required this.contactName,
    required this.contactPhone,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            child: Text(
              contactLetter,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 2),
                child: Text(
                  contactName,
                  // maxLines:   4,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Text(
                  contactPhone,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
