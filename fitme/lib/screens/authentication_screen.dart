import 'package:flutter/material.dart';

import '../globals.dart';
import '../services/authentication_services.dart';

class AuthenticationScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                AuthenticationServices().googleSignIn(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
