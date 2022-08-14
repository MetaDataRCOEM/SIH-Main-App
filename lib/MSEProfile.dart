import 'package:flutter/material.dart';

class MSEProfile extends StatefulWidget {
  const MSEProfile({Key? key}) : super(key: key);

  @override
  State<MSEProfile> createState() => _MSEProfileState();
}

class _MSEProfileState extends State<MSEProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MSE Profile"),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Show Snack',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: const [
                            Text(
                              "Hemraj Raut",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "MSE No. : xxxxxxxx",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.grey,
                          foregroundImage: AssetImage(
                            "assets/user.jpg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
