  
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCube(
          color: Color.fromRGBO(250, 120, 130, 1),
          size: 30.0,
        ),
      ),
    );
  }
}