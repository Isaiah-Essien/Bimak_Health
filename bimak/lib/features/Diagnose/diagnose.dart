import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bimak/features/Prediction/predict.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:bimak/utils/constants/colors.dart';
import 'package:bimak/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:bimak/common/widgets/custom_shapes/curved_shapes/curved_edges.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({Key? key}) : super(key: key);

  @override
  _DiagnoseScreenState createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  File? _image;
  bool _isLoading = false;
  String _prediction = "";

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _prediction = ""; // Clear previous prediction if new image is selected
      });
    }
  }

  Future<void> _predictImage() async {
    if (_image == null) return;

    setState(() {
      _isLoading = true;
    });

    final url = 'https://braintumor-35p6.onrender.com/predict';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final decoded = jsonDecode(respStr);

        setState(() {
          _prediction = decoded['prediction']['class'];
          _isLoading = false;
        });

        _startTimer(); // Start timer after setting prediction
      } else {
        setState(() {
          _prediction = 'Error: Could not get prediction';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _prediction = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 7), () {
      setState(() {
        _prediction = ""; // Clear prediction text after 7 seconds
      });
    });
  }

  void _clearImage() {
    setState(() {
      _image = null;
      _prediction = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MCustomCurvedEdges(),
              child: Container(
                color: MColors.primaryColor,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: MCircularContainer(
                          backgroundColor: MColors.light.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: MCircularContainer(
                          backgroundColor: MColors.light.withOpacity(0.1),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Brain Tumor Detection',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _pickImage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(150, 40), // Increased width
                              ),
                              child: const Text(
                                'Upload Image',
                                style: TextStyle(color: MColors.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_image != null)
                    Image.file(
                      _image!,
                      height: 150,
                    )
                  else
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'No image selected.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: _predictImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MColors.primaryColor,
                      minimumSize: const Size(150, 40), // Increased width
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text('Predict'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_prediction.isNotEmpty)
              FadeInLeft(
                child: AnimatedOpacity(
                  opacity: _prediction.isNotEmpty ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                      color: _prediction == "Tumor Detected"
                          ? Colors.red // Red background for "Tumor Detected"
                          : Colors.green, // Green background for "No Tumor Detected"
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _prediction,
                      style: const TextStyle(
                        color: Colors.white, // White text color for both backgrounds
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            if (_image != null || _prediction.isNotEmpty)
              TextButton(
                onPressed: _clearImage,
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: MColors.primaryColor,
                    width: 2.0,
                  ),
                  minimumSize: const Size(150, 40),
                ),
                child: const Text('Predict Again'),
              ),
            const SizedBox(height: 20),
            const Text(
              'Chat with Bimak about your diagnosis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Get.to(() => const ChatScreen()),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: MColors.primaryColor,
                  width: 2.0,
                ),
                minimumSize: const Size(150, 40),
              ),
              child: const Text(
                'Chat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
