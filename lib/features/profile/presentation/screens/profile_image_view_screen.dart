import 'package:flutter/material.dart';

class ProfileImageViewScreen extends StatelessWidget {
  final String imagePath;

  const ProfileImageViewScreen({Key? key, required this.imagePath})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          child: Image.asset(imagePath),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black87,
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Choose photo'),
        ),
      ),
    );
  }
}
