import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newshop/widget/constants.dart';
import 'package:newshop/widget/profile_tile.dart';
import 'package:newshop/widget/topbar.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: kUpperBoxDecoration,
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "About us",
                  style: kScreenHeadingTextStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ProfileTile(
                    name: 'Pratyush Rajpara',
                    assetImage: 'images/denish.jpg',
                    linkedinUrl:
                        'https://www.linkedin.com/in/denish-ranpariya-428478167/',
                    githubUrl: 'https://github.com/Denish-Ranpariya',
                    emailId: 'pvrajpara.ce@gmail.com',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  ProfileTile(
                    name: 'Jaimin Rana',
                    assetImage: 'images/jaimin.jpg',
                    linkedinUrl:
                        'https://www.linkedin.com/in/jaimin-rana-2bb531186/',
                    githubUrl: 'https://github.com/Jaiminrana',
                    emailId: 'jaiminrana8080@gmail.com',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
