import 'package:doctors_app/core/helpers/app_regex.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/widgets/app_text_formfield.dart';
import 'package:doctors_app/features/login/logic/login_cubit.dart';
import 'package:doctors_app/features/login/ui/widget/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase( passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });

  }




  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                  return 'Please enter vaild email';
                }
              },
              controller: context.read<LoginCubit>().emailController,
              hintText: 'email',
              backgroundColor: AppColors.moreLightGray,
            ),
            verticalSpacing(20),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              hintText: 'password',
              backgroundColor: AppColors.moreLightGray,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.gray,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter vaild password';
                }
              },
            ),
            verticalSpacing(24),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialChar: hasSpecialChar,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ],
        ));
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}


