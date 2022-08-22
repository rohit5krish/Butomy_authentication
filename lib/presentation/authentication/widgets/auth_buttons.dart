import 'package:butomy/constants/constants.dart';
import 'package:flutter/material.dart';

class AuthButtonsWidget extends StatelessWidget {
  final String buttonTxt;
  final buttonIcon;
  final Function onTapFunction;
  const AuthButtonsWidget({
    required this.buttonIcon,
    required this.buttonTxt,
    required this.onTapFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: () async {
            return await onTapFunction();
          },
          child: Container(
            width: double.infinity,
            height: 60,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: buttonTxt == 'Google' ? Colors.blue : Colors.green[400],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                buttonIcon,
                Spacer(),
                Text(
                  buttonTxt,
                  style: whiteTxt18,
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}
