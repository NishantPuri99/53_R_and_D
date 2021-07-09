import 'package:fitme/services/authentication_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Sign out'),
        onPressed: () {
          AuthenticationServices().googleSignOut(context: context);
        },
      ),
    );
  }
}
