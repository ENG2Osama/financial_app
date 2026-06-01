import 'package:flutter/material.dart';

class homepageview extends StatelessWidget {
  const homepageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Banking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_sharp),
            label: 'Banking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_sharp),
            label: 'Banking',
          ),
        ],
      ),
    );
  }
}
