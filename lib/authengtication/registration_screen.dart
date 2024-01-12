
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok/authengtication/authentication_controller.dart';
import 'package:tiktok/authengtication/login_screen.dart';
import 'package:tiktok/widgets/input_text_widget.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);


  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController userNameTextEditingController= TextEditingController();
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  bool showProgressBar = false;

  var authenticationController = AuthenticationController.instanceAuth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20,),
            child: Column(
              children: [
                const SizedBox(height: 80,),

                Text("Create Account",
                  style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),),
                Text("to get Started Now!",
                  style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,

                  ),),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                authenticationController.chooseImageWithCamera();
                  },
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      "images/1.4 profile_avatar.jpg"
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                InputTextWidget(
                  textEditingController: userNameTextEditingController,
                  lableString: "UserName",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
                const SizedBox(height: 20,),
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
                          setState(() {
                            showProgressBar = true;
                          });
                        },
                        child: const Center(
                          child: Text(
                            "Sign Up",
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
                          "Already have an Account?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: const   Text(
                            "Login Now",
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
