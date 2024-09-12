import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:planta/widgets/change_password.dart/changePass_textfield.dart';
import 'package:planta/widgets/change_password.dart/confirm_button.dart';
import 'package:planta/widgets/change_password.dart/password_checker.dart';
import 'package:planta/widgets/change_password.dart/title_text_widget.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordContoller = TextEditingController();
  TextEditingController newPasswordContoller = TextEditingController();
  TextEditingController confirmPasswordContoller = TextEditingController();
  bool isOldPasswordObscure = true;
  bool isNewPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  Color _oldPassborderColor = Colors.grey;
  Color _newPassborderColor = Colors.grey;
  Color _confirmPassborderColor = Colors.grey;
  bool includeUpperCharFlag = false;
  bool includeLowerCharFlag = false;
  bool includeAtleastSpecialCharFlag = false;
  bool includeNumericCharFlag = false;
  bool minPassLenFlag = false;

  List<Map<String, dynamic>> passwordRules = [];

  void _updateOldPasswordBorderColor() {
    setState(() {
      if (oldPasswordContoller.text.isEmpty) {
        _oldPassborderColor = Colors.grey;
      } else {
        _oldPassborderColor = const Color.fromARGB(255, 46, 103, 124);
      }
    });
  }

  String? _validateConfirmPassword() {
    if (newPasswordContoller.text != confirmPasswordContoller.text) {
      return 'Mismatch password';
    }
    return null;
  }

  void _updateNewPasswordBorderColor() {
    setState(() {
      if (newPasswordContoller.text.isEmpty) {
        _newPassborderColor = Colors.grey;
      } else {
        _newPassborderColor = const Color.fromARGB(255, 46, 103, 124);
      }
    });
  }

  void _updateConfirmPasswordBorderColor() {
    setState(() {
      if (confirmPasswordContoller.text.isEmpty) {
        _confirmPassborderColor = Colors.grey;
      } else {
        _confirmPassborderColor = const Color.fromARGB(255, 46, 103, 124);
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      minPassLenFlag = value.length >= 8;
      includeUpperCharFlag = value.contains(RegExp(r'[A-Z]'));
      includeLowerCharFlag = value.contains(RegExp(r'[a-z]'));
      includeNumericCharFlag = value.contains(RegExp(r'[0-9]'));
      includeAtleastSpecialCharFlag =
          value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

      passwordRules = [
        {
          'text': 'Include lower case letter',
          'valid': includeLowerCharFlag,
        },
        {
          'text': 'Include upper case letter',
          'valid': includeUpperCharFlag,
        },
        {
          'text': 'Include numeric character',
          'valid': includeNumericCharFlag,
        },
        {
          'text': 'Include at least 1 special character',
          'valid': includeAtleastSpecialCharFlag,
        },
        {
          'text': 'Minimum password length 8 characters',
          'valid': minPassLenFlag,
        },
      ];
    });
  }

  @override
  void initState() {
    passwordRules = [
      {
        'text': 'Include lower case letter',
        'valid': includeLowerCharFlag,
      },
      {
        'text': 'Include upper case letter',
        'valid': includeUpperCharFlag,
      },
      {
        'text': 'Include numeric character',
        'valid': includeNumericCharFlag,
      },
      {
        'text': 'Include at least 1 special character',
        'valid': includeAtleastSpecialCharFlag,
      },
      {
        'text': 'Minimum password length 8 characters',
        'valid': minPassLenFlag,
      },
    ];

    super.initState();
    oldPasswordContoller.addListener(_updateOldPasswordBorderColor);
    newPasswordContoller.addListener(_updateNewPasswordBorderColor);
    confirmPasswordContoller.addListener(_updateConfirmPasswordBorderColor);
  }

  @override
  void dispose() {
    oldPasswordContoller.dispose();
    newPasswordContoller.dispose();
    confirmPasswordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextWidget(title: 'Change Password', fontSize: 22),
                ChangepassTextfield(
                  labelText: 'Old Password',
                  hintText: 'Old Password',
                  isObscure: isOldPasswordObscure,
                  onPressed: () {
                    setState(() {
                      isOldPasswordObscure = !isOldPasswordObscure;
                    });
                  },
                  contoller: oldPasswordContoller,
                  borderColor: _oldPassborderColor,
                ),
                const TitleTextWidget(
                    title: 'Enter your password', fontSize: 18),
                ChangepassTextfield(
                    labelText: 'New Password',
                    hintText: 'New Password',
                    isObscure: isNewPasswordObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    onPressed: () {
                      setState(() {
                        isNewPasswordObscure = !isNewPasswordObscure;
                      });
                    },
                    contoller: newPasswordContoller,
                    borderColor: _newPassborderColor,
                    onChanged: _validatePassword),
                const TitleTextWidget(title: 'Password must:', fontSize: 18),
                // PasswordChecker(
                //   validColor: includeLowerCharFlag ? Colors.green : Colors.grey,
                //   validationText: 'Include lower',
                // ),
                // PasswordChecker(
                //   validColor: includeUpperCharFlag ? Colors.green : Colors.grey,
                //   validationText: 'Upper lower',
                // ),
                // PasswordChecker(
                //   validColor: includeAtleastSpecialCharFlag
                //       ? Colors.green
                //       : Colors.grey,
                //   validationText: 'Include at least 1 special character',
                // ),
                // PasswordChecker(
                //   validColor:
                //       includeNumericCharFlag ? Colors.green : Colors.grey,
                //   validationText: 'Include numeric character',
                // ),
                // PasswordChecker(
                //   validColor: minPassLenFlag ? Colors.green : Colors.grey,
                //   validationText: 'Minimum password length 8 characters',
                // ),

                Column(
                  children: passwordRules.map((rule) {
                    return PasswordChecker(
                      validColor: rule['valid'] ? Colors.green : Colors.grey,
                      validationText: rule['text'],
                    );
                  }).toList(),
                ),

                const SizedBox(
                  height: 16,
                ),
                ChangepassTextfield(
                  labelText: 'Confirmation',
                  hintText: 'Confirmation',
                  isObscure: isConfirmPasswordObscure,
                  validator: (value) => _validateConfirmPassword(),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordObscure = !isConfirmPasswordObscure;
                    });
                  },
                  contoller: confirmPasswordContoller,
                  borderColor: _confirmPassborderColor,
                ),
                ConfirmButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Success')),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
