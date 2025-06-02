import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_image_picker_app/imagepicker_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagepickerController controller = Get.put(ImagepickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('GetX Imagepicker'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    controller.imagePath.isEmpty
                        ? FileImage(File(controller.imagePath.toString()))
                        : null,
              ),
            ),
            TextButton(
              onPressed: () {
                controller.getImage();
              },
              child: Text('Pick Image'),
            ),
          ],
        );
      }),
    );
  }
}
