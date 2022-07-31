import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leochat/Screens/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat.dart';
class SignUp extends StatefulWidget {
  static String id = 'SignUp';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();

  final password = TextEditingController();

   final auth = FirebaseAuth.instance;

   bool isSync = false;
   GlobalKey<FormState> formkey = GlobalKey();

   Random r = Random();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isSync,
      color: Colors.transparent,
      progressIndicator:CircularProgressIndicator(
        color:Color.fromRGBO(r.nextInt(255),r.nextInt(255),r.nextInt(255),1),
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(height: 50,),
              Image.asset('assets/leo.png',color: Colors.white,height: 300,),
              const Center(child: Text('Leo Chat App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),

              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    labelStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(16),

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white,
                        ),
                      borderRadius:BorderRadius.circular(16),
                  ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: password,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      label: const Text('Password'),
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(16),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius:BorderRadius.circular(16),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,

                    ),
                    child: MaterialButton(onPressed: ()async{
                     if(formkey.currentState!.validate()){
                       setState(() {

                       });
                       isSync = true;
                       try {
                         UserCredential USER = await auth
                             .createUserWithEmailAndPassword(
                             email: email.text, password: password.text);
                         Navigator.pushNamed(context, Chat.id);
                       } catch(ex){
                         setState(() {

                         });
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error ${ex.toString()}'),));

                       }
                       isSync = false;
                     }



                    },child: const Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),)),
              ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('Already Have An Account  ?',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
              const SizedBox(width: 5,),
              GestureDetector(onTap: (){
                Navigator.pushNamed(context, LogIn.id);
              },child: const Text('Log In',style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),)),
            ],
          ),

            ],
          ),
        ),
      ),
    );
  }
}
