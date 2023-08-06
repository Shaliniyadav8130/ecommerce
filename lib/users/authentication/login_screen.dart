import 'package:ecommerce/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:LayoutBuilder(
          builder: (context,cons){
            return ConstrainedBox(constraints: BoxConstraints(
              minHeight: cons.maxHeight,
              ),
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    //LoginScreen Header
                    SizedBox(
                      width:MediaQuery.of(context).size.width,
                      height:285,
                      child: Image.asset("assets/images/login.jpg"),
                    ),

                    //Login Form
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.white24,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color:Colors.black26,
                              offset:Offset(0,-3),
                          ),
                        ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30.0,30.0,30.0,8),
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    //email
                                    TextFormField(
                                      controller: emailController,
                                      validator: (val)=> val == "" ? "Please enter email" : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.email,
                                          color: Colors.black,
                                        ),
                                        hintText: "email...",
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color:Colors.white60
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color:Colors.white60
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color:Colors.white60
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color:Colors.white60
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 14,
                                        ),
                                        fillColor: Colors.white,
                                        filled:true,
                                      ),
                                    ),
                                    SizedBox(
                                      height:18,
                                    ),
                                    //password
                                    Obx(
                                            ()=>TextFormField(
                                              controller: passwordController,
                                              obscureText: isObsecure.value,
                                              validator: (val)=> val == "" ? "Please enter password" : null,
                                              decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                  Icons.vpn_key_sharp,
                                                  color: Colors.black,
                                                ),
                                                suffixIcon: Obx(
                                                      ()=>GestureDetector(
                                                    onTap: (){
                                                      isObsecure.value = !isObsecure.value;
                                                    },
                                                    child: Icon(
                                                      isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                hintText: "password...",
                                                border:OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color:Colors.white60
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color:Colors.white60
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color:Colors.white60
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color:Colors.white60
                                                  ),
                                                ),
                                                contentPadding: const EdgeInsets.symmetric(
                                                  vertical: 6,
                                                  horizontal: 14,
                                                ),
                                                fillColor: Colors.white,
                                                filled:true,
                                              ),
                                            ),
                                    ),
                                    SizedBox(height:18),

                                    Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: (){

                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 28,
                                          ),
                                          child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account"),
                                  TextButton(
                                      onPressed: (){
                                        Get.to(SignupScreen());
                                      },
                                      child: Text("Register Now"))
                                ],
                              ),

                              Text("or",style: TextStyle(color: Colors.grey),),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Are you an Admin"),
                                  TextButton(
                                      onPressed: (){},
                                      child: Text("Click Here"))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

    );
  }
}