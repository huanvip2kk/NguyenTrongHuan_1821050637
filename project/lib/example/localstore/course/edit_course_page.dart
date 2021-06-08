
import 'package:codefactory/example/localstore/supplier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'course_model.dart';


class EditCoursePage extends StatefulWidget {
  final CourseModel? course;

  EditCoursePage({
    Key? key,
    this.course,
  }) : super(key: key);

  @override
  _EditCoursePageState createState() => _EditCoursePageState();
}

class _EditCoursePageState extends State<EditCoursePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleKey = GlobalKey<FormFieldState>();
  final _descKey = GlobalKey<FormFieldState>();


  @override
  Widget build(BuildContext context) {
    var course = widget.course;
    return Scaffold(
      appBar: AppBar(
        title: course == null ? Text('New course') : Text('Edit course'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (course == null) {
                  course = CourseModel(
                    title: _titleKey.currentState!.value,
                    desc: _descKey.currentState!.value,
                  );
                } else {
                  course?.title = _titleKey.currentState!.value;
                  course?.desc = _descKey.currentState!.value;
                }
                course?.save();
                print('Succsess');
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: _titleKey,
                initialValue: course?.title,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length > 0) {
                    return null;
                  }
                  return 'Empty!';
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                key: _descKey,
                initialValue: course?.desc,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length > 0) {
                    return null;
                  }
                  return 'Empty!';
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
