import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leochat/Screens/signup.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat.dart';
final email = TextEditingController();

final userName = TextEditingController();

final password = TextEditingController();

File ? image ;
class LogIn extends StatefulWidget {
  static String id = 'LogIn';

  const LogIn({Key? key}) : super(key: key);
  @override
  State<LogIn> createState() => _LogInState();

}

class _LogInState extends State<LogIn> {



  ImagePicker imagePicker = ImagePicker();


  bool isSync = false;

  final auth = FirebaseAuth.instance;

  Random r = Random();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall:isSync,
      color: Colors.transparent,
      progressIndicator:CircularProgressIndicator(
        color:Color.fromRGBO(r.nextInt(255),r.nextInt(255),r.nextInt(255),1)
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 50,),
              Image.asset('assets/leo.png',color: Colors.white,height: 300,),
              const Center(child: Text('Leo Chat App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()async{
                      setState(() {

                      });
                      final XFile ? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
                      setState(() {
                        image = File(pickedImage!.path);

                      });
                    },
                    child: Column(
                      children: const [
                        Text('Add From',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        Text('Camera',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 2,
                    height:60,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 10,),
                  CircleAvatar(
                    radius:35,
                    backgroundImage: image != null ? FileImage(image!) : null,
                    child: image == null ?  Image.asset('assets/profile.jpg') : null,

                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 2,
                    height:60,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 10,),

                  GestureDetector(
                    onTap: ()async{

                      final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        image = File(pickedImage!.path);

                      });

    },

                    child: Column(
                      children: const [
                        Text('Add From',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        Text('Gallery',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),




                ],
              ),

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Enter Your Username';
                    }
                    return null;

                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: userName,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      label: const Text('Username'),
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
                      if(formKey.currentState!.validate()){
                        setState(() {

                        });

                        isSync = true;
                        try {
                          UserCredential USER = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(Chat.id, (Route<dynamic> route) => false);
                        } catch(ex){
                          setState(() {

                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error ${ex.toString()}'),));
                        }
                        isSync = false;
                      }




                    },child: const Text('Log In',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),)),
              ),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont Have An Account  ?',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                  const SizedBox(width: 5,),
                  GestureDetector(onTap: (){
                    Navigator.pushNamed(context, SignUp.id);
                  },child: const Text('Sign Up',style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),)),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
