import 'package:flutter/material.dart';

class ViewDetailsScreen extends StatelessWidget {
  const ViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(
              minRadius: 50,
              maxRadius: 50,
              foregroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tell Me',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This application is a chat with artificial intelligence',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This app uses OpenAI API',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The application was programmed by Mohannad Hisham',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
