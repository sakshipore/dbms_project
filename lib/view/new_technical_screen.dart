import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTechnicalScreen extends StatelessWidget {
  NewTechnicalScreen({Key? key}) : super(key: key);

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
                  hintText: "Enter your Name",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Name";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Company Name",
                  hintText: "Enter your Company Name",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Company Name";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Model no",
                  hintText: "Enter your Model no",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Model no";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Specification",
                  hintText: "Enter your Specification",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Specification";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Bill no",
                  hintText: "Enter your Bill no",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Bill no";
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Cost",
                  hintText: "Enter your Cost",
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
                    "Add Technical",
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
