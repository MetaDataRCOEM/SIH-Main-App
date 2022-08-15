import 'package:flutter/material.dart';

class EmpImgPage extends StatefulWidget {
  const EmpImgPage({Key? key}) : super(key: key);

  @override
  State<EmpImgPage> createState() => _EmpImgPageState();
}

class _EmpImgPageState extends State<EmpImgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Show Snack',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Share your profile')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
