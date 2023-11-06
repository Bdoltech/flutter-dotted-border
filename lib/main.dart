import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dotted Border Examples'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              rectBorderWidget,
              rectBorderWithPaddingWidget,
              RoundedRectangleBorderWidget,
              customBorder,
            ],
          ),
        ),
      ),
    );
  }

  Widget get rectBorderWidget {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 100, // Adjust the height
        width: 60,   // Adjust the width
        color: Colors.red[700],
      ),
    );
  }

  Widget get rectBorderWithPaddingWidget {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: DottedBorder(
        dashPattern: [8, 4],
        strokeWidth: 4,
        padding: EdgeInsets.all(4), // Adjust the padding
        borderPadding: EdgeInsets.all(2), // Adjust the border padding
        child: Container(
          height: 100, // Adjust the height
          width: 60,   // Adjust the width
          color: Colors.red.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget get RoundedRectangleBorderWidget {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(6), // Adjust the radius
      padding: EdgeInsets.all(3), // Adjust the padding
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)), // Adjust the radius
        child: Container(
          height: 100, // Adjust the height
          width: 60,   // Adjust the width
          color: Colors.teal[300],
        ),
      ),
    );
  }

  Widget get customBorder {
    Path customPath = Path()
      ..moveTo(10, 10)
      ..lineTo(30, 50)
      ..lineTo(10, 90)
      ..lineTo(50, 50)
      ..lineTo(10, 10);

    return DottedBorder(
      customPath: (_) => customPath,
      color: Colors.indigo,
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 220, // Adjust the height
        width: 150,   // Adjust the width
        color: Colors.amber.withAlpha(20),
      ),
    );
  }
}
