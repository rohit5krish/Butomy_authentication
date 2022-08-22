// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:butomy/constants/constants.dart';
import 'package:butomy/infrastructure/auth_methods/auth_methods.dart';
import 'package:butomy/presentation/authentication/widgets/auth_buttons.dart';
import 'package:butomy/presentation/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Unknown Error'),
                  );
                } else if (snapshot.hasData) {
                  return HomeScreen();
                } else {
                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/firebase_logo.png',
                          height: 300,
                          width: 300,
                        ),
                        Column(
                          children: [
                            AuthButtonsWidget(
                              buttonIcon: CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/google_logo.png',
                                ),
                              ),
                              buttonTxt: 'Google',
                              onTapFunction: () async {
                                await AuthMethods().googleLogin();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AuthButtonsWidget(
                              buttonIcon: Icon(
                                Icons.phone,
                                color: whiteColor,
                              ),
                              buttonTxt: 'Phone',
                              onTapFunction: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              })),
    );
  }
}
