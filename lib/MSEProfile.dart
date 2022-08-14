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
        // backgroundColor: Colors.orangeAccent,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50.0,
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                        ),
                      )
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
