import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);
bool obserText = true;

void validation(){
  final FormState? _form = _formKey.currentState;
  if(_form!.validate()){
    print("yes");
  }
  else{
    print("no");
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Register", style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  )
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 500,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value == ""){
                          return "Please enter Username";
                        }
                        else if(value!.length < 4){
                          return "Username too short!";
                        }
                        return "";
                      },
                      decoration: const InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        border: OutlineInputBorder()
                      ),
                    ),
                    TextFormField(
                      validator: (value){
                        if(!regExp.hasMatch(value!)){
                          return "Email invalid!";
                        }
                        else if(value == ""){
                          return "Please enter Email";
                        }
                        return "";
                      },
                      decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value){
                        if(value == ""){
                          return "Please enter Password";
                        }
                        else if(value!.length < 8){
                          return "Password too short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                                obserText? Icons.visibility : Icons.visibility_off, color: Colors.black),
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black
                          ),
                          border: const OutlineInputBorder()
                      ),
                    ),
                    TextFormField(
                      validator: (value){
                        if(value == ""){
                          return "Please enter Phone Number";
                        }
                        else if(value!.length != 10){
                          return "Phone Number must be 10 digits!";
                        }
                        return "";
                      },
                      decoration: const InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: MyButton(name: "Register", onPressed: validation)
                    ),
                    const SizedBox(height: 5),
                    Column(
                      children: [
                        const Text("I Already Have An Account!"),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (ctx) =>const Login()));
                          },
                          child: const Text("Login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
