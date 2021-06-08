import 'package:flutter/material.dart';

class ShowAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String text, String ans) {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 2000),
        backgroundColor:
            ans.compareTo("Yes") == 0 ? Colors.lightGreenAccent : Colors.yellow,
        content: Row(
          children: [
            Icon(
              ans.compareTo("Yes") == 0 ? Icons.favorite : Icons.watch,
              color: ans.compareTo("Yes") == 0 ? Colors.pink : Colors.yellow,
              size: 24,
              semanticLabel: text,
            ),
            Text(text),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Future<void> _alertDialog() async {
      // void _datePickerDialog() {
      //   DateTime now = DateTime.now();
      //   showDatePicker(
      //           context: context,
      //           initialDate: now,
      //           firstDate: DateTime(2000),
      //           lastDate: DateTime(2050))
      //       .then((onValue) {
      //     _showSnackBar('$onValue','yes');
      //   });
      // }

      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('It ok'),
              title: Text('Alert dialog'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Yes');
                  },
                  child: Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'No');
                  },
                  child: Text('No'),
                ),
              ],
            );
          })) {
        case "Yes":
          _showSnackBar('Thanks', 'Yes');
          break;
        case "No":
          _showSnackBar("No", "No");
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert dialog'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _alertDialog, child: Text('Alert dialog'))
        ],
      ),
    );
  }
}
