import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduationupdate/colors/app_colors.dart';
class OutputScreen extends StatelessWidget {
  final output;
  final image;
  const OutputScreen({Key? key, this.output, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(title: Text('Result'),
      backgroundColor: AppColors.pageBackground
      ),
      body: Center(
        child:             Text(output[0]['label'],
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold
        ),
        ),
       ),
    );


  }
}