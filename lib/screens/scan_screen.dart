import 'package:bizcotap/screens/home_screen.dart';
import 'package:bizcotap/widgets/camera/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<CameraDescription> cameras = [];
  final bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    try {
      cameras = await availableCameras();

      if (cameras.isNotEmpty) {
        Navigator.pushNamed(context, '/camera');
      } else {
        if (kDebugMode) {
          print('No cameras available');
        }
      }
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('Error initializing cameras: $e');
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialized
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/camera');
              },
              child: const CameraScreen(),
            )
          : const Center(
              child: HomeScreen(),
            ),
    );
  }
}
