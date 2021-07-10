import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication_screen.dart';
import '../screens/index.dart';
import '../globals.dart';
import '../models/appUser.dart';
import '../providers/auth_provider.dart';
import '../services/authentication_services.dart';

class NavigatorScreen extends StatefulWidget {
  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  Future signIn;

  @override
  void initState() {
    super.initState();

    signIn = AuthenticationServices().silentSignIn(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;

    return FutureBuilder(
      future: signIn,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<AuthProvider>(
            builder: (_, authProvider, child) {
              AppUser appUser = authProvider.getAppUser;
              if (appUser == null) {
                return AuthenticationScreen();
              }
              return Index();
            },
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.pinkAccent,
            ),
          ),
        );
      },
    );
  }
}
