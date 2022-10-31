import 'package:dbms_project/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewUserEntryScreen extends StatefulWidget {
  const NewUserEntryScreen({Key? key}) : super(key: key);

  @override
  State<NewUserEntryScreen> createState() => _NewUserEntryScreenState();
}

class _NewUserEntryScreenState extends State<NewUserEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter first name";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Last Name",
                  hintText: "Enter your Last Name",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Last Name";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "ID",
                  hintText: "Enter your ID",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter ID";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "Enter your Address",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Address";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Moblie no",
                  hintText: "Enter your Moblie no",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Moblie no";
                  }
                  return null;
                }),
              ),
              SizedBox(
                height: 100.h,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Add Product",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
