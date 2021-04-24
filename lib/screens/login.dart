import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshop/services/auth_services.dart';
import 'package:newshop/services/connectivity_services.dart'; 
import 'package:newshop/widget/loading.dart';
import 'package:newshop/widget/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 110),
                  Expanded(
                    flex: 1,
                    child: Image.asset('images/sya_logo_final2.png',
                      //'images/mainLogo.png',
                      height:1200 ,
                      width: 1200,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:60.0),
                      child: Text(
                        'Shree Yamuna Jeweller',
                        style: GoogleFonts.patuaOne(
                          fontSize: 40,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      bool result =
                          await ConnectivityService.getConnectivityStatus();
                      if (result) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          print('Called');
                          User firebaseUser =
                              await AuthService().signInWithGoogle();
                          print('Return');
                          print(firebaseUser.uid);

                          if (!_disposed) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                          ToastClass.buildShowToast('Logged in');
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      } else {
                        ToastClass.buildShowToast('No internet connection');
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                4.0,
                                4.0,
                              ),
                            )
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: SvgPicture.asset('images/google_logo.svg',
                                  height: 30),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Sign in with Google',
                                style: GoogleFonts.patuaOne(
                                  fontSize: 20,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
