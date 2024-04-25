import 'package:flutter/material.dart';
import 'package:plant_identify/view/pages/camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'History',
          ),
        ],
      ),
      body: PageView(
        children: const [
          CameraPage(),
        ],
      ),
    );
  }
}
