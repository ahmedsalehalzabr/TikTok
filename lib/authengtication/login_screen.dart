import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok/authengtication/authentication_controller.dart';
import 'package:tiktok/authengtication/registration_screen.dart';

import '../widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();

  var authenticationController = AuthenticationController.instanceAuth;
  bool showProgressBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20,),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Image.asset(
                  "images/1.6 tiktok.png",
                  width: 200,
                ),
                Text("Welcome",
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),),
                Text("Glad to see you!",
                  style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,

                  ),),
                const SizedBox(height: 30,),
                InputTextWidget(
                  textEditingController: emailTextEditingController,
                  lableString: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
                const SizedBox(height: 20,),

                InputTextWidget(
                  textEditingController: passwordTextEditingController,
                  lableString: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
                const SizedBox(height: 20,),
                showProgressBar == false ?
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 38,
                          height: 54,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                             if(emailTextEditingController.text.isNotEmpty &&
                             passwordTextEditingController.text.isNotEmpty)
                               {
                                 setState(() {
                                   showProgressBar = true;
                                 });
                                 authenticationController.loginUserNow(
                                   emailTextEditingController.text,
                                   passwordTextEditingController.text,
                                 );
                               }
                            },
                            child: const Center(
                              child: Text("Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const Text(
                              "Don't have an Account?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(RegistrationScreen(),);

                              },
                              child: const   Text(
                                "SignUp Now",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ) : Container(
                  child: const SimpleCircularProgressBar(
                   progressColors: [
                     Colors.green,
                     Colors.blueAccent,
                     Colors.red,
                     Colors.blue,
                     Colors.amber,
                     Colors.purple
                   ],
                    animationDuration: 4,
                    backColor: Colors.white38,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
