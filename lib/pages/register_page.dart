import 'package:flutter/material.dart';
import 'package:shukranngrp/api_service.dart';
import 'package:shukranngrp/models/customer.dart';
import 'package:shukranngrp/utils/ProgressHUD.dart';
import 'package:shukranngrp/utils/form_helper.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late APIService apiService;
  late CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = new APIService();
    model =
        new CustomerModel(email: '', firstName: '', lastName: '', password: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: true,
          title: Text('Shuraknn'),
        ),
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _formUi(),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _formUi() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHelper.fieldLabel('First Name'),
              FormHelper.textInput(
                context,
                model.firstName,
                (value) => {
                  this.model.firstName = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter the First Name';
                  }
                  return null;
                },
              ),
              FormHelper.fieldLabel('Last Name'),
              FormHelper.textInput(
                context,
                model.lastName,
                (value) => {
                  this.model.lastName = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter the Last Name';
                  }
                  return null;
                },
              ),
              FormHelper.fieldLabel('Email'),
              FormHelper.textInput(
                context,
                model.email,
                (value) => {
                  this.model.email = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter an Email ';
                  }
                  return null;
                },
              ),
              FormHelper.fieldLabel('Password'),
              FormHelper.textInput(
                context,
                model.password,
                (value) => {
                  this.model.password = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter the Password';
                  }
                  return null;
                },
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Theme.of(context).accentColor.withOpacity(0.4),
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: FormHelper.saveButton(
                  'Register',
                  () {
                    if (validAndSave()) {
                      print(model.toJson());
                      setState(() {
                        isApiCallProcess = true;
                      });
                      apiService.createCustomer(model).then(
                        (ret) {
                          setState(() {
                            isApiCallProcess = false;
                          });
                          if (ret) {
                            FormHelper.showMessage(
                              context,
                              'Shurakhnn',
                              'Registered Successfully',
                              'Ok',
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          } else {
                            FormHelper.showMessage(
                              context,
                              'Shurakhnn',
                              'Registered Unsuccessfully',
                              'Ok',
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
