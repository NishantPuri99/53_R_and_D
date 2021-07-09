import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/appUser.dart';

class FirestoreServices {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> uploadUserData(
      {@required AppUser oldAppUser, @required AppUser updatedAppUser}) async {
    FirebaseFirestore.instance.collection('USERS').doc(oldAppUser.uid).set(
          updatedAppUser.toJson(),
        );

    FirebaseFirestore.instance
        .collection('POSTS')
        .where('username', isEqualTo: oldAppUser.name)
        .get()
        .then(
      (querySnapshot) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          doc.reference.update(
            {
              'username': updatedAppUser.name,
              'userPicture': updatedAppUser.pictureUrl,
            },
          );
        }
      },
    );
  }
}
