import 'package:flutter/material.dart';
import 'package:sih_main/MSEProfile.dart';

class MSELogin extends StatefulWidget {
  const MSELogin({Key? key}) : super(key: key);

  @override
  State<MSELogin> createState() => _MSELoginState();
}

class _MSELoginState extends State<MSELogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userController = new TextEditingController();
  final TextEditingController mseController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userField = TextFormField(
      autofocus: false,
      controller: userController,
      keyboardType: TextInputType.text,
      //validator: () => {},
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

    final mseField = TextFormField(
      autofocus: false,
      controller: mseController,
      keyboardType: TextInputType.text,
      //validator: () => {},
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
        hintText: 'Enter MSE ID',
      ),
    );

    final passField = TextFormField(
      autofocus: false,
      controller: passwordController,
      //validator: () => {},
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
        title: const Text("MSE Login"),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Show Snack',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Officer login to your ID')));
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
                    child: mseField,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MSEProfile(),
                          ),
                        )
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
