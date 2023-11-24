import 'package:flutter/material.dart';

class ElabBody extends StatefulWidget {
  const ElabBody({super.key});

  @override
  State<ElabBody> createState() => _ElabBodyState();
}

class _ElabBodyState extends State<ElabBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
