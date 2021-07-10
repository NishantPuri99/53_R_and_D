import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/appUser.dart';

class FirestoreServices {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> uploadUserData({@required AppUser appUser}) async {
    FirebaseFirestore.instance.collection('USERS').doc(appUser.uid).set(
          appUser.toJson(),
        );
  }
}
