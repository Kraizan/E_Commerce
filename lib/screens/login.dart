import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
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

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Login", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50
                    ),),
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
                            onTap: (){
                              setState(() {
                                obserText = !obserText;
                              });
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
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MyButton(name: "Login", onPressed: validation)
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        const Text("So, you are a new user?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (ctx) =>const SignUp()));
                          },
                          child: const Text("Sign Up!",
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
