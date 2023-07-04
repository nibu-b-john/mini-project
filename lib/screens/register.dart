import 'dart:developer';
import 'package:nemesis_hackathon/data/db/firestore_helper.dart';
import 'package:nemesis_hackathon/data/user_list.dart';
import 'package:nemesis_hackathon/models.dart/shared_preference.dart';
import 'package:nemesis_hackathon/models.dart/user_model.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../widgets/notiLeaveForm.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);

      Navigator.pushNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  String? errorMessage = '';
  final _form = GlobalKey<FormState>();

  final _loginPassword = TextEditingController();

  final _passwordController = TextEditingController();

  void onSubmit(registerNumber, password) async {
    final validate = _form.currentState!.validate();
    if (!validate) {
      return;
    }
    createUserWithEmailAndPassword(registerNumber, password);
    // postLoginDetails(registerNumber, password)
    // try {
    //   await Authservice().signInWithEmailAndPassword(
    //       email: _loginPassword.text, password: _passwordController.text);
    log(_loginPassword.text);

    // } on FirebaseAuthException catch (e) {
    //   setState(() {
    //     errorMessage = e.message;
    //   });
    // }
    // final storeUser = Provider.of<UserList>(context, listen: false);
    // fetchUser().then((value) => {
    //           Provider.of<SavedUser>(context, listen: false).loggedInUser(
    //             value['user_id'],
    //             value['organization'],
    //             value['name'],
    //             value['profile_pic'],
    //             value['rating'],
    //             value['type'],
    //             value['details'],
    //           )
    //         }
    // (value)  => {await Shared_Preferences.setString(value['name'])}
    // storeUser.loggedInUser(
    //       value['user_id'],
    //       value['details'],
    //       value['organization'],
    //       value['name'],
    //       value['profile_pic'],
    //       value['rating'],
    //       value['type'],
    //     )
    // );

    // final model =
    //     userModel(name: 'Tinu', type: 'hotel', organization: 'Tinu and Sons');
    // log(model.toString());
    // firestoreHelper.create(
    //     userModel(name: 'Tinu', type: 'hotel', organization: 'Tinu and Sons'));
  }

  Future<dynamic> fetchUser() async {
    return await firestoreHelper.readUser();
  }

  // _passwordController.clear();
  // _passwordController.clear();

  bool changeIcon = true;
  bool IconPosition = false;
  double positionRight = 20;
  double positionBottom = -9;

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.height.toString());
    log(MediaQuery.of(context).size.width.toString());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 212, 212, 212),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // const NotiLeaveWidget(
                      //   // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                      //   from: 'Donate',
                      //   to: 'Recyclable',
                      //   status: 'Hello',
                      //   typeOFLeave: 'Hello',
                      //   numberOfDays: 15,
                      //   checked_periods: [1, 2, 3],
                      //   ifDonate: 'Donate',
                      //   ifRecylable: 'Recycleble',
                      //   time: 'Ordered Time: 15:00 IST',
                      // ),
                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.012820,
                          ),
                          const Text('Register',
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: height * 0.038461,
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.026410,
                      ),
                      Form(
                          key: _form,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: TextFormField(
                                  controller: _loginPassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a valid email';
                                    } else if (!value.contains('@')) {
                                      return 'Enter a valid email';
                                    } else if (!value.contains('@')) {
                                      return 'Enter a valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  autocorrect: false,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Email',
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.0238205,
                                        horizontal: 20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.0192307),
                              Stack(
                                children: [
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: TextFormField(
                                        enableSuggestions: false,
                                        controller: _passwordController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            setState(() {
                                              positionRight = 20;
                                              positionBottom = 10;
                                            });
                                            return 'Enter a valid password';
                                          } else if (value.length <= 8) {
                                            return 'Password should contain minimum of 8 characters';
                                          } else {
                                            setState(() {
                                              positionRight = 20;
                                              positionBottom = -9;
                                            });
                                            return null;
                                          }
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        cursorColor: Colors.black,
                                        autocorrect: false,
                                        textInputAction: TextInputAction.next,
                                        obscureText: changeIcon ? true : false,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                            fontSize: 10,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                              color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: height * 0.0228205,
                                              horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // right: 20,
                                    // bottom: -9,
                                    right: positionRight,
                                    bottom: positionBottom,
                                    child: SizedBox(
                                      height: height * 0.080769,
                                      child: changeIcon
                                          ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  changeIcon = !changeIcon;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.visibility_off,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  changeIcon = !changeIcon;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.056410,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  onSubmit(_loginPassword.text,
                                      _passwordController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Theme.of(context).colorScheme.primary,
                                  // side:
                                  //     const BorderSide(color: Colors.black)
                                ),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have a account?"),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(" Sign In")),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: height * 0.576923,
              child: SizedBox(
                height: height * 0.512820,
                child: const Image(
                    image: AssetImage(
                  'assets/nemesis_logo.png',
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
