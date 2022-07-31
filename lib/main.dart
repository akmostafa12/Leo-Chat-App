// @dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:leochat/Screens/chat.dart';
import 'package:leochat/Screens/login.dart';
import 'package:leochat/Screens/signup.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignUp.id : (context) =>SignUp(),
        LogIn.id: (context) => LogIn(),
        Chat.id : (context) => Chat(),
      },
      initialRoute:LogIn.id,
    );
  }
  }


