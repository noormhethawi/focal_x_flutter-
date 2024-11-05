import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscure;
  //final Function valid;
  // final Key key;
  final FormFieldValidator<String>? valid;
  final TextEditingController controller;
  final FocusNode focusNode;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscure,
    required this.valid,
    required this.focusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        // SizedBox(height: 1.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            //color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: TextFormField(
              //  key: key,
              controller: controller,
              validator: valid,
              obscureText: obscure,
              focusNode: focusNode,
              // obscureText: obscure,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                //   suffixIcon: IconButton(
                //     icon: Icon(obscure
                //         ? Icons.visibility
                //         : Icons.visibility_off),
                //  //   onPressed: () => controller.toggleObscure(),
                //   ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
