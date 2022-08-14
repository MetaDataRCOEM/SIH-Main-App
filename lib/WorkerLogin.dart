import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sih_main/HomePage.dart';
import 'package:sih_main/MSEProfile.dart';

class WorkerLogin extends StatefulWidget {
  const WorkerLogin({Key? key}) : super(key: key);

  @override
  State<WorkerLogin> createState() => _WorkerLoginState();
}

class _WorkerLoginState extends State<WorkerLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userController = new TextEditingController();
  final TextEditingController mseController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final userField = TextFormField(
      autofocus: false,
      controller: userController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your username");
        }

        if (!RegExp("^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]")
            .hasMatch(value)) {
          return ("Please enter a valid username");
        }
        return null;
      },
      onSaved: (value) {
        userController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        fontSize: 18.0,
      ),
      decoration: const InputDecoration(
        icon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        border: InputBorder.none,
        hintText: 'Enter Username',
      ),
    );

    final empField = TextFormField(
      autofocus: false,
      controller: mseController,
      keyboardType: TextInputType.text,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        mseController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        fontSize: 18.0,
      ),
      decoration: const InputDecoration(
        icon: Icon(
          Icons.security,
          color: Colors.grey,
        ),
        border: InputBorder.none,
        hintText: 'Enter Employee ID',
      ),
    );

    final passField = TextFormField(
      autofocus: false,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');

        if (value!.isEmpty) {
          return ("Please enter your password");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter valid password");
        }

        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        fontSize: 18.0,
      ),
      decoration: const InputDecoration(
        icon: Icon(
          Icons.password,
          color: Colors.grey,
        ),
        border: InputBorder.none,
        hintText: 'Enter Password',
      ),
      obscureText: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Login"),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Show Snack',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Employee login to your ID')));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/mnrega.png',
                    height: 150.0,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "MNREGA Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login with your credentials",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: userField,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: empField,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: passField,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: FlatButton(
                      onPressed: () => {
                        Login(userController.text, mseController.text,
                            passwordController.text)
                      },
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Login(String user, String emp, String pass) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: user, password: pass)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login successful!"),
                print(user + pass),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MSEProfile(),
                  ),
                )
              })
          .catchError((e) {
        print(user + pass);
        Fluttertoast.showToast(msg: user);
      });
    }
  }
}
