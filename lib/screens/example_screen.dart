import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newshop/screens/home.dart';
import 'package:newshop/services/auth_services.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color:Colors.blueGrey.shade800,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
        
           
          Text('Logged In',style:TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          ),
          SizedBox(height:10),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage:NetworkImage(user.photoURL),
          ),
          SizedBox(height:10),
          Text('Name:'+user.displayName,style:TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          ),
          
          SizedBox(height:10),
          Text('email:'+user.email,style:TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          ), 
          SizedBox(height:10),
          ElevatedButton(onPressed:()=>AuthService().logout(),
          child: Text('Log out'),),

           ElevatedButton(onPressed:(){ 
             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
           },
          child: Text('home page'),),
        ],
      ),
    );
  }
}