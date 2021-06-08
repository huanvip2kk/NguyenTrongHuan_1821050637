import 'package:codefactory/example/localstore/supplier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EditSupplierPage extends StatefulWidget {
  final Supplier? supplier;

  EditSupplierPage({
    Key? key,
    this.supplier,
  }) : super(key: key);

  @override
  _EditSupplierPageState createState() => _EditSupplierPageState();
}

class _EditSupplierPageState extends State<EditSupplierPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleKey = GlobalKey<FormFieldState>();
  final _addressKey = GlobalKey<FormFieldState>();
  final _phoneNumberKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    var supplier = widget.supplier;
    return Scaffold(
      appBar: AppBar(
        title: supplier == null ? Text('New supplier') : Text('Edit supplier'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (supplier == null) {
                  supplier = Supplier(
                    title: _titleKey.currentState!.value,
                    address: _addressKey.currentState!.value,
                    phoneNumber: _phoneNumberKey.currentState!.value,
                  );
                } else {
                  supplier?.title = _titleKey.currentState!.value;
                  supplier?.address = _addressKey.currentState!.value;
                  supplier?.phoneNumber = _phoneNumberKey.currentState!.value;
                }
                supplier?.save();
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
                initialValue: supplier?.title,
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
                key: _addressKey,
                initialValue: supplier?.address,
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
              TextFormField(
                key: _phoneNumberKey,
                keyboardType: TextInputType.phone,
                initialValue: supplier?.phoneNumber,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length > 0) {
                    return null;
                  }
                  return 'Empty!';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
