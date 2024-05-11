import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/on_boarding/widget/doc_logo_widget.dart';
import 'package:doctors_app/features/on_boarding/widget/doctor_image_and_text.dart';
import 'package:doctors_app/features/on_boarding/widget/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h , bottom: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(
                  height: 30.h,
                ),
                const DoctorImageAndText(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font13GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                     const onBoardingButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
