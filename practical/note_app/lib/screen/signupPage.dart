import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:note_app/services/signupServices.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {


  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _contact=TextEditingController();
  TextEditingController _password=TextEditingController();

  var curentuser=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('signup'),
        centerTitle: true,
      ),



      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 500,
              width: 380,
              // color: Colors.black,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        label: Text('enter your name'),
                      ),
                    ),
                  ),




                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      controller: _email,
                      decoration:InputDecoration(
                        label: Text('enter your email')
                      ),
                    ),
                  ),


                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      controller: _contact,
                      decoration: InputDecoration(
                        label: Text('contact number')
                      ),
                    ),
                  ),


                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:50),
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        label: Text('enter your password'),

                      ),
                    ),
                  ),



                //   ==========butttons====================


                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 100,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )

                          ),


                            onPressed: ()async {
                            var name=_name.text.trim();
                            var email=_email.text.trim();
                            var contact=_contact.text.trim();
                            var password=_password.text.trim();


                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email,
                                password: password)
                            .then((value)=>{
                              signupuser(name, email, contact, password)
                            });
                            },


                            child: Text('sign-up',style: TextStyle(
                              fontSize: 15
                            ),)

                        ),
                      ),

                      Container(
                       child: InkWell(
                         onTap: (){},
                         child: Text('login with google',style: TextStyle(
                           fontSize: 18
                         ),),
                       ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
