import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/screens/complication_details.dart';
import 'package:medicine_tracker/utils/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.searchText = '', this.searchState = false})
      : super(key: key);
  final String searchText;
  final bool searchState;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: searchState ? getNormalResult(searchText) : getSearchResult(),
      builder: (context, snapshot) {
        List<GestureDetector> listTilesList = [];
        if (snapshot.hasData) {
          var snapData = snapshot.data!.docs;
          for (var snaps in snapData) {
            String complication = snaps.get('complication');
            String date = snaps.get('date');
            String doctor = snaps.get('doctor');
            String author = snaps.get('addedBy');
            if (author == FirebaseAuth.instance.currentUser?.uid) {
              var newTile = GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComplicationDetails(
                        listId: snaps.id,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        complication,
                        style: kComplicationTextStyle,
                      ),
                      trailing: Text(date),
                      subtitle: Text(doctor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              );
            listTilesList.add(newTile);
            }
          }
        }
        return Column(
          children: listTilesList.isNotEmpty
              ? listTilesList
              : [const Text('No datas found')],
        );
      },
    );
  }
}

Stream<QuerySnapshot> getSearchResult() async* {
  var firestore = FirebaseFirestore.instance;
  var _search = firestore.collection('medication').snapshots();
  yield* _search;
}

Stream<QuerySnapshot> getNormalResult(String string) async* {
  var firestore = FirebaseFirestore.instance;
  var _search = firestore
      .collection('medication')
      .where('complicationForSearch',
          isGreaterThanOrEqualTo: string.toLowerCase())
      .snapshots();
  yield* _search;
}
