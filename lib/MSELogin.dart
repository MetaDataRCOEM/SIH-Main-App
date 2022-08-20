import 'package:flutter/material.dart';
import 'package:sih_main/MSEProfile.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/authserve.dart';

class MSELogin extends StatefulWidget {
  const MSELogin({Key? key}) : super(key: key);

  @override
  State<MSELogin> createState() => _MSELoginState();
}

class _MSELoginState extends State<MSELogin> {
  var username, ID, pass, token;

  @override
  Widget build(BuildContext context) {
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
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                      onChanged: (value) {
                        username = value;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Username',
                      ),
                    ),
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
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                      onChanged: (value) {
                        ID = value;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.security,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter MSE ID',
                      ),
                    ),
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
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                      onChanged: (value) {
                        pass = value;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: FlatButton(
                          onPressed: () {
                            AuthService().auth(username, ID, pass).then(
                              (value) {
                                if (value.data['success']) {
                                  token = value.data['token'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MSEProfile()));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: value.data['message'],
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Colors.orange,
                    //         borderRadius: BorderRadius.circular(20.0)),
                    //     child: FlatButton(
                    //       onPressed: () {
                    //         AuthService().getInfo(token).then(
                    //           (value) {
                    //             Fluttertoast.showToast(
                    //               msg: value.data['msg'],
                    //               toastLength: Toast.LENGTH_SHORT,
                    //               gravity: ToastGravity.BOTTOM,
                    //               backgroundColor: Colors.yellowAccent,
                    //               textColor: Colors.black,
                    //               fontSize: 16.0,
                    //             );
                    //           },
                    //         );
                    //       },
                    //       child: const Center(
                    //         child: Text(
                    //           'Get Info',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
