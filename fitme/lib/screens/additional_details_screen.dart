import 'package:fitme/constants.dart';
import 'package:fitme/models/appUser.dart';
import 'package:fitme/providers/auth_provider.dart';
import 'package:fitme/services/firestoreServices.dart';
import 'package:fitme/widgets/filled_button.dart';
import 'package:fitme/widgets/line_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdditionalDetailsScreen extends StatefulWidget {
  @override
  _AdditionalDetailsScreenState createState() =>
      _AdditionalDetailsScreenState();
}

class _AdditionalDetailsScreenState extends State<AdditionalDetailsScreen> {
  Future<void> saveUser() async {
    AuthProvider prov = Provider.of<AuthProvider>(context, listen: false);
    AppUser authProvider = prov.getAppUser;

    AppUser appUser = AppUser(
      uid: authProvider.uid,
      name: authProvider.name,
      email: authProvider.email,
      age: int.parse(ageController.text),
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
      targetWeight: double.parse(targetWeightController.text),
      gender: selectedGender,
    );

    prov.setAppUser = appUser;
    await FirestoreServices().uploadUserData(appUser: appUser);
  }

  final GlobalKey _formKey = GlobalKey<FormState>();

  String selectedGender;
  TextEditingController ageController;
  TextEditingController heightController;
  TextEditingController weightController;
  TextEditingController targetWeightController;

  @override
  void initState() {
    super.initState();

    ageController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    targetWeightController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please enter the following details',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  DropdownButtonFormField<String>(
                    decoration: inputDecoration.copyWith(
                      labelText: 'Gender',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                    value: selectedGender,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    onChanged: (String newValue) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('Female'),
                        value: 'Female',
                      ),
                      DropdownMenuItem(
                        child: Text('Male'),
                        value: 'Male',
                      ),
                      DropdownMenuItem(
                        child: Text('Prefer not to say'),
                        value: 'Prefer not to say',
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Age
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration.copyWith(
                      labelText: 'Age',
                    ),
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Height
                  TextFormField(
                    controller: heightController,
                    decoration: inputDecoration.copyWith(
                      labelText: 'Height in cm',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Weight
                  TextFormField(
                    controller: weightController,
                    decoration: inputDecoration.copyWith(
                      labelText: 'Weight in kg',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Target Weight
                  TextFormField(
                    controller: targetWeightController,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration.copyWith(
                      labelText: 'Target Weight in kg',
                    ),
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Button here
                  FilledButton(
                    color: Colors.black,
                    title: 'Next',
                    onTap: () async {
                      await saveUser();
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
