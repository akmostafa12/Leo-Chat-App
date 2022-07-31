import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leochat/Screens/login.dart';
import 'package:leochat/Widgets/messagebubble.dart';
class Chat extends StatefulWidget {
  static String id = 'chat';

  const Chat({Key? key}) : super(key: key);
  @override
  State<Chat> createState() => _ChatState();
}
class _ChatState extends State<Chat> {
  final text = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('Messages');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1,),
            CircleAvatar(
              radius: 20,
              backgroundImage: image != null ? FileImage(image!) : null,
              child: image == null ?  Image.asset('assets/profile.jpg') : null,
            ),
            const SizedBox(width: 7,),
            const Text('Chat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            const Spacer(flex: 1,),

            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, LogIn.id);
              },
                child: const Text('Sign Out',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),))

          ],),
        backgroundColor: Colors.black,
        elevation: 0,


      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(32), topRight:Radius.circular(32)

          ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child:MessageBubble()
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: text,
                  onSubmitted: (_){
                     users.add({
                      'text' : text.text,
                      'createdAt' : DateTime.now(),
                       'username' : userName.text,
                       'email' : email.text,
                       'password' : password.text,
                     });
                     text.clear();
                  },
                  decoration: InputDecoration(
                      hintText: 'Send Message...',
                      suffixIcon: IconButton(onPressed: (){
                        users.add({
                          'text' : text.text,
                          'createdAt' : DateTime.now(),
                          'username' : userName.text,
                          'email' : email.text,
                          'password' : password.text,
                        });
                        text.clear();

                      },icon:const Icon(Icons.arrow_forward_ios_sharp)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
