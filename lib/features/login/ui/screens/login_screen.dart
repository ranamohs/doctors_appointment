import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/app_text_formfield.dart';
import 'package:doctors_app/core/widgets/dont_have_account_text.dart';
import 'package:doctors_app/core/widgets/terms_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpacing(35),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpacing(36),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      hintText: 'email',
                      backgroundColor: AppColors.moreLightGray,
                    ),
                    verticalSpacing(20),
                    AppTextFormField(
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
                            isObscureText
                                ? Icons.visibility
                                : Icons.visibility_off,

                            color: AppColors.gray,
                          )),
                    ),
                    verticalSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpacing(40),
                    AppTextButton(buttonText: 'Login', textStyle: TextStyles.font16WhiteSemiBold, onPressed:(){
                    },),
                    verticalSpacing(16),
                    TermsAndConditionsText(),
                    verticalSpacing(60),
                    DontHaveAccountText(),




                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
