import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshop/screens/wrapper.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.amber,
      ),
      home: MySplash(),//MyHomePage(),
    );
  }
}

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SplashScreen(
      photoSize: 100,
      seconds: 3,
      title: Text(
        'Shree Yamuna Jewellers',
        style: GoogleFonts.patuaOne(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      image: Image(
        image: AssetImage('images/sya_logo_final2.png'),
        fit: BoxFit.cover,
      ),
       
      backgroundColor:Color.fromRGBO(1, 1, 1, 1),//Color(0xffc9e3db),
      //navigateAfterSeconds:LoginScreen(),//MyHomePage(),
      navigateAfterSeconds: Wrapper(),
    );
  }
}
