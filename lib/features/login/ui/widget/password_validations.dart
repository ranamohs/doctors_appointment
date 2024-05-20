import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialChar;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialChar,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('at least 1 lowercase letter', hasLowerCase),
        verticalSpacing(2),
        buildValidationRow('at least 1 Uppercase letter', hasUpperCase),
        verticalSpacing(2),
        buildValidationRow('at least 1 special character', hasSpecialChar),
        verticalSpacing(2),
        buildValidationRow('at least 1 number', hasNumber),
        verticalSpacing(2),
        buildValidationRow('at least 8 characters long', hasMinLength),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: AppColors.gray,
      ),
      horizontalSpacing(6),
      Text(text,
          style: TextStyles.font13BlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? AppColors.gray : AppColors.darkBlue))
    ],
  );
}
