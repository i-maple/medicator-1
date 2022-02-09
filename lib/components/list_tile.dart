import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/screens/complication_details.dart';
import 'package:medicine_tracker/utils/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('medication').snapshots(),
      builder: (context, snapshot) {
        List<GestureDetector> listTilesList = [];
        if (snapshot.hasData) {
          var snapData = snapshot.data!.docs;
            for (var snaps in snapData) {
              String complication = snaps.get('complication');
              String date = snaps.get('date');
              String doctor = snaps.get('doctor');
              var newTile = GestureDetector(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComplicationDetails(listId: snaps.id,),
                  ),
                );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:10.0),
                    child: ListTile(
                      title: Text(
                        complication,
                        style: kComplicationTextStyle,
                      ),
                      trailing: Text(date),
                      subtitle: Text(doctor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              );
              listTilesList.add(newTile);
            }
        }
        return Column(
          children: listTilesList,
        );
      },
    );
  }
}
