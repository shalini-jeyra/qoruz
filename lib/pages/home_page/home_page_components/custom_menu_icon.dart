import 'package:flutter/material.dart';

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 24,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 3,
            color: Colors.white,
          ),
          SizedBox(height: 4),
          Container(
            width: 30,
            height: 3,
            color: Colors.white,
          ),
          SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 15,
              height: 3,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
