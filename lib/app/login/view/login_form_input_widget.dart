// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginFormInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isObscureText;
  final Function(String?) validator;
  const LoginFormInputWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.isObscureText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 6),
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
          TextFormField(
            controller: controller,
            validator: (value) => validator(value),
            obscureText: isObscureText,
            maxLength: 20,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                errorMaxLines: 5,
                counterText: '',
                prefixIcon: Icon(
                  icon,
                  color: const Color(0Xff20283b),
                ),
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}
