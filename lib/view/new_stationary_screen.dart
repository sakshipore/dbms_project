import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewStationaryScreen extends StatelessWidget {
  NewStationaryScreen({Key? key}) : super(key: key);

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
                  labelText: "Item",
                  hintText: "Enter your Item",
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter Item";
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
                    "Add Stationary",
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
