import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newshop/screens/example_screen.dart';
import 'package:newshop/screens/home.dart';
import 'package:newshop/screens/login.dart';
import 'package:newshop/services/database_service.dart';
import 'package:newshop/widget/alert_dialog_box.dart';
 

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future<bool> onPressedBack() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialogBox(
        textMessage: 'Do you really want to close the app?',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // will return login screen or form screen
    //return either home or authenticate widget
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          User _user = snapshot.data;
          if (_user != null) {
            return FutureBuilder<String>(
               future: DatabaseService(uid: _user.uid).getRegisterStatus,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Example();//ToggleWrapper();
                  } else {
                    return WillPopScope(
                        onWillPop: onPressedBack, child:MyHomePage()); //FormScreen());
                  }
                });
          } else {
            return WillPopScope(onWillPop: onPressedBack, child: LoginScreen());
          }
        }
    );


  }
}
