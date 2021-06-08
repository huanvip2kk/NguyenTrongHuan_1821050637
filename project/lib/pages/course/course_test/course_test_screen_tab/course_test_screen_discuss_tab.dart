import 'package:flutter/material.dart';

class CourseTestScreenDiscussTab extends StatelessWidget {
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
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            width: 48,
            height: 48,
          ),
          onPressed: null
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    Text('1 of 20',style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16,color: Colors.grey),),
                    SizedBox(height: 16,),
                    Text('Which tag for \n the biggest header',style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),),
                    SizedBox(height: 16,),
                    Container(
                      height: 191,
                      color: Colors.red,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Container(
                              height: 58,
                              child: OutlinedButton(
                                onPressed: null,
                                child: Text(
                                  'A. <h5>',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 16),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Container(
                              height: 58,
                              child: OutlinedButton(
                                onPressed: null,
                                child: Text(
                                  'A. <h5>',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 16),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Container(
                              height: 58,
                              child: OutlinedButton(
                                onPressed: null,
                                child: Text(
                                  'A. <h5>',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 16),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Continue'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
