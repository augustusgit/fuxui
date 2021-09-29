import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class EditForm extends StatelessWidget {
  const EditForm(
      {required this.formLabelText,
      required this.formFieldHint,
      required this.formFileStartIcon,
      required this.formFileEndIcon,
      this.obscureText = false,
      this.showEndIcon = false,
      required this.suffixIconAction});

  final String formLabelText;
  final String formFieldHint;
  final bool obscureText;
  final bool showEndIcon;
  final IconData? formFileStartIcon;
  final IconData? formFileEndIcon;
  final VoidCallback? suffixIconAction;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(formLabelText),
          TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: formFieldHint,
              prefixIcon: formFileStartIcon != null
                  ? Icon(
                      formFileStartIcon,
                      color: AppColors.black,
                      size: 18.0,
                    )
                  : null,
              suffixIcon: showEndIcon
                  ? IconButton(
                      onPressed: suffixIconAction,
                      icon: Icon(
                        formFileEndIcon,
                        color: AppColors.black,
                        size: 12.0,
                      ),
                    )
                  : null,
            ),
          ),
          Spacing.mediumHeight()
        ],
      ),
    );
  }
}
