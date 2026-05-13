import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox( // SizedBox is cleaner for fixed dimensions
              height: 120,
              width: 300,
              child: Image.network(
                'https://picsum.photos', // A valid direct image link
                errorBuilder: (context, error, stackTrace) => 
                    const Text('Link failed'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
