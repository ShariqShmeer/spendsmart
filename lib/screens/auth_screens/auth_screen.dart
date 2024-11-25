import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';
import 'package:spendsmart/utils/extensions/string_extensions.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';
import 'package:spendsmart/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _numberNode = FocusNode();
  final FocusNode _dobNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confPasswordNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isLogin = true;
  int bodyHeight = 80;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(isLogin ? 'Logged In' : "Form submitted!"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: isLogin
                    ? [
                        Text('Email : ${_emailController.text}'),
                        Text('Password : ${_passwordController.text}'),
                      ]
                    : [
                        Text('Name : ${_nameController.text}'),
                        Text('Email : ${_emailController.text}'),
                        Text('Number : ${_numberController.text}'),
                        Text('Dob : ${_dobController.text}'),
                        Text('Password : ${_passwordController.text}'),
                        Text('con-Password : ${_confPasswordController.text}'),
                      ],
              ),
            );
          });

      Future.delayed(const Duration(milliseconds: 3000), () {
        isLoading = false;
        setState(() {});
        GoRouter.of(context).goNamed(Screens.homeMain);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();
    _emailNode.dispose();
    _dobNode.dispose();
    _nameNode.dispose();
    _numberNode.dispose();
    _passwordNode.dispose();
    _confPasswordNode.dispose();
    super.dispose();
  }

  _switchScreens() {
    isLogin = !isLogin;
    setState(() {});
    _nameController.clear();
    _dobController.clear();
    _numberController.clear();
    _confPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isLogin
            ? CustomScaffold(
                key: const ValueKey(0),
                resizeToAvoidBottomInset: true,
                addTopSafeArea: true,
                roundedBodyPercentage: bodyHeight,
                topWidget: Center(
                  child: Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                roundedBodyWidget: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      70.hSpace,
                      CustomTextField(
                        focusNode: _emailNode,
                        textEditingController: _emailController
                          ..text = 'email@email.email',
                        name: 'Email',
                        fieldHint: 'Enter your Email',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9@._-]')),
                        ],
                        onFieldSubmitted: (value) {
                          // Move focus to the second field
                          FocusScope.of(context).requestFocus(_passwordNode);
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
                        focusNode: _passwordNode,
                        textEditingController: _passwordController
                          ..text = '1234567',
                        name: 'Password',
                        fieldHint: 'Enter your Password',
                        isPasswordField: true,
                        onFieldSubmitted: (value) {
                          // Move focus to the second field
                          _submitForm(context);
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
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushNamed(Screens.resetPassword);
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ),
                      200.hSpace,
                      _footerWidget(context),
                    ],
                  ),
                ),
              )
            : CustomScaffold(
                key: const ValueKey(1),
                roundedBodyPercentage: bodyHeight,
                resizeToAvoidBottomInset: true,
                addTopSafeArea: true,
                topWidget: Center(
                  child: Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                roundedBodyWidget: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 5.h,
                  ),
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
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9@._-]')),
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
                      CustomTextField(
                        focusNode: _passwordNode,
                        textEditingController: _passwordController,
                        name: 'Password',
                        fieldHint: 'Enter your Password',
                        isPasswordField: true,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_confPasswordNode);
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
                      20.hSpace,
                      _footerWidget(context),
                    ],
                  ),
                )),
      ),
    );
  }

  Widget _footerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    _submitForm(context);
                  },
            child: Text(isLogin ? 'Log In' : 'Sign Up')),
        5.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isLogin
                ? 'Don’t have an account?'
                : 'Already have an account?'),
            TextButton(
                onPressed: _switchScreens,
                child: Text(isLogin ? 'Sign Up' : 'Log In'))
          ],
        ),
      ],
    );
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
      FocusScope.of(context).requestFocus(_passwordNode);
    }
  }
}
