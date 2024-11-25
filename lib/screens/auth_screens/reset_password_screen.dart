import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';
import 'package:spendsmart/utils/extensions/string_extensions.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

import '../../widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _numberNode = FocusNode();
  final FocusNode _dobNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confPasswordNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isMatch = false;

  @override
  void dispose() {
    _emailController.dispose();
    _dobController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();

    _emailNode.dispose();
    _dobNode.dispose();
    _numberNode.dispose();
    _passwordNode.dispose();
    _confPasswordNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 85,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      addTopSafeArea: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      topWidget: Center(
        child: Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      roundedBodyWidget: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 10.h,
        ),
        child: Form(
          key: _formKey,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            child:
                isMatch ? _setNewPassword(context) : _takeCredentials(context),
          ),
        ),
      ),
    );
  }

  Widget _takeCredentials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        50.hSpace,
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
            // Move focus to the second field
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
            FocusScope.of(context).requestFocus(_passwordNode);
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
        80.hSpace,
        ElevatedButton(
            onPressed: () {
              _submitForm(context);
            },
            child: Text('Next')),
      ],
    );
  }

  Widget _setNewPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        70.hSpace,
        CustomTextField(
          focusNode: _passwordNode,
          textEditingController: _passwordController,
          name: 'Password',
          fieldHint: 'Enter your Password',
          isPasswordField: true,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_confPasswordNode);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password.';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long.';
            }
            return null;
          },
        ),
        CustomTextField(
          focusNode: _confPasswordNode,
          textEditingController: _confPasswordController,
          name: 'Confirm Password',
          fieldHint: 'Enter your Password',
          isPasswordField: true,
          onFieldSubmitted: (value) {
            // Move focus to the second field
            _submitForm(context);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password.';
            } else if (value != _passwordController.text) {
              return 'Passwords do not match.';
            }
            return null;
          },
        ),
        80.hSpace,
        ElevatedButton(
            onPressed: () {
              _submitForm(context);
            },
            child: Text('Next')),
      ],
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      if (!isMatch) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Form submitted!"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Email : ${_emailController.text}'),
                  Text('Number : ${_numberController.text}'),
                  Text('Date of Birth : ${_dobController.text}'),
                ],
              ),
            );
          },
        );
        _credentialMatch();
        setState(() {});
      } else {
        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (context) {
        //     return AlertDialog(
        //       title: Text('Password is Set'),
        //       content: Column(mainAxisSize: MainAxisSize.min, children: [
        //         Text('password : ${_passwordController.text}'),
        //         Text('Confirm password : ${_confPasswordController.text}'),
        //       ]),
        //     );
        //   },
        // );
        // Future.delayed(const Duration(seconds: 1), () {
        //   Navigator.pop(context);
        // });
        GoRouter.of(context).pushReplacementNamed(Screens.loading);
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
    if (dob != null) {
      _dobController.text = dob.toString();
    }
    if (_dobController.text.isNotEmpty) {
      _submitForm(context);
    }
  }

  void _credentialMatch() {
    isMatch = !isMatch;
  }
}
