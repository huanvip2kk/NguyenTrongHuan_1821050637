import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
            width: 48,
            height: 48,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 375,
          height: 367,
          child: Column(
            children: [
              Container(
                width: 375,
                height: 253,
                color: Colors.red,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 373,
                height: 82,
                child: Column(
                  children: [
                    Text(
                      'Course not found',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Try searching the course with \n a different keyword',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
