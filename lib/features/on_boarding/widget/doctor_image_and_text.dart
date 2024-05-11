import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset('assets/svgs/doc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.14, 0.4])),
          child: Image(image: AssetImage('assets/svgs/onboarding_doctor.png')),
        ),
        Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Text(
              'Best Doctor Appointment App',
              textAlign: TextAlign.center,
              style: TextStyles.font32BlueBold.copyWith(
                height: 1.4
              ),
            ))
      ],
    );
  }
}
