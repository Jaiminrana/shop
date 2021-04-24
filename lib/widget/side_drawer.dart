import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newshop/screens/about_us_screen.dart';
import 'package:newshop/widget/constants.dart';

class SideDrawer extends StatelessWidget {
  final Function onPressedQrCode;
  final Function onLogout;
  final user = FirebaseAuth.instance.currentUser;

  SideDrawer({this.onPressedQrCode, this.onLogout});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.amberAccent, //Color(0xFFc9e3db),
            padding: EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Hi,' + user.displayName,
                  style: kScreenHeadingTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage:
                      NetworkImage(FirebaseAuth.instance.currentUser.photoURL),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
            child: Center(
              child: ListTile(
                leading: Icon(
                  Icons.note,
                  color: Colors.grey[700],
                ),
                title: Text('About Us'),
              ),
            ),
          ),
          GestureDetector(
            onTap: onLogout,
            child: Center(
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.grey[700],
                ),
                title: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
