import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewBookEntryScreen extends StatefulWidget {
  const NewBookEntryScreen({Key? key}) : super(key: key);

  @override
  State<NewBookEntryScreen> createState() => _NewBookEntryScreenState();
}

class _NewBookEntryScreenState extends State<NewBookEntryScreen> {
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
                  labelText: "Name",
                  hintText: "Enter Book Name",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter book name";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Author",
                  hintText: "Enter Author Name",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Author name";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Edition",
                  hintText: "Enter Edition",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Edition";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Publication",
                  hintText: "Enter Publication",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Publication";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Cost",
                  hintText: "Enter Cost",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Cost";
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Data is processing',
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Add Book",
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
