import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/features/login/data/models/login_request_body.dart';
import 'package:doctors_app/features/login/logic/login_cubit.dart';
import 'package:doctors_app/features/login/ui/widget/dont_have_account_text.dart';
import 'package:doctors_app/features/login/ui/widget/login_bloc_listener.dart';
import 'package:doctors_app/features/login/ui/widget/terms_conditions_text.dart';
import 'package:doctors_app/features/login/ui/widget/email_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
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
                Column(
                  children: [
                    const EmailAndPassword(),
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
                      validateThenDoLogin(context);
                    },),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(60),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
            
            
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {

    context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
        email:    context.read<LoginCubit>().emailController.text,
        password: context.read<LoginCubit>().passwordController.text));

  }
}
