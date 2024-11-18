import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/screens/profile_screens/widgets/profile_widget.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';
import 'package:spendsmart/utils/extensions/string_extensions.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';
import 'package:spendsmart/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: 'abc@gmail.com');
  final TextEditingController _nameController =
      TextEditingController(text: 'name');
  final TextEditingController _numberController =
      TextEditingController(text: '876543234567');
  final TextEditingController _dobController =
      TextEditingController(text: '2024-11-16 00:00:00.000');

  final FocusNode _nameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _numberNode = FocusNode();
  final FocusNode _dobNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _numberController.dispose();

    _emailNode.dispose();
    _dobNode.dispose();
    _nameNode.dispose();
    _numberNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 75,
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      topWidget: ProfileWidget(
        name: 'Muhammad Shariq Shmeer',
        email: 'shariqshmeer@gmail.com',
        number: '03043455791',
        onTap: () {
          print('Edit Picture tapped');
        },
      ),
      roundedBodyWidget: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 30.h,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                focusNode: _nameNode,
                textEditingController: _nameController,
                name: 'Full name',
                fieldHint: 'Enter your Name',
                onFieldSubmitted: (value) {
                  // Move focus to the second field
                  FocusScope.of(context).requestFocus(_emailNode);
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    _nameController.clear();
                    return 'Please enter your full name.';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                focusNode: _emailNode,
                textEditingController: _emailController,
                name: 'Email',
                fieldHint: 'Enter your Email',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
                ],
                onFieldSubmitted: (value) {
                  // Move focus to the second field
                  FocusScope.of(context).requestFocus(_numberNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  } else if (!value.isValidEmail) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                focusNode: _numberNode,
                textEditingController: _numberController,
                name: 'Mobile Number',
                fieldHint: 'Enter your Mobile Number',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_dobNode);
                  _dobOnTap(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number.';
                  } else if (!value.isValidMobileNumber) {
                    return 'Please enter a valid mobile number.';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
              CustomTextField(
                readOnly: true,
                focusNode: _dobNode,
                textEditingController: _dobController,
                name: 'Date of birth',
                fieldHint: 'Select your Date of birth',
                onFieldSubmitted: (value) {
                  // Move focus to the second field
                  _submitForm(context);
                },
                onTap: () {
                  _dobOnTap(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your date of birth.';
                  }
                  return null;
                },
                keyboardType: TextInputType.datetime,
              ),
              20.hSpace,
              ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          _submitForm(context);
                        },
                  child: Text('Update Profile')),
              20.hSpace,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      bool wantToSave = false;

      wantToSave = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Confirm"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Are you sure to save these Changes?'),
                      Text('Name : ${_nameController.text}'),
                      Text('Email : ${_emailController.text}'),
                      Text('Number : ${_numberController.text}'),
                      Text('Dob : ${_dobController.text}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Yes'),
                    ),
                  ],
                );
              }) ??
          false;

      if (wantToSave) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          isLoading = false;
          setState(() {});
          GoRouter.of(context).pushNamed(Screens.loading);
        });
      }
    }
  }

  Future<void> _dobOnTap(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? dob = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 100),
      lastDate: currentDate,
    );
    print(dob);
    if (dob != null) {
      _dobController.text = dob.toString();
    }
    if (_dobController.text.isNotEmpty) {
      _submitForm(context);
    }
  }
}
