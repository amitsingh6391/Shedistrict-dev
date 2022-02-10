import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;

  StepProgress({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: currentStep == 0 ? const Color(0XFF808DF1) : (currentStep > 0 ? const Color.fromRGBO(96, 237, 172, .5) :  const Color(0XFFEFF0FD)),
                ),
              ),
              Expanded(
                child: Container(
                    height: 3,
                    color: const Color(0XFFEFF0FD),
                    )
              ),
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: currentStep == 1 ? const Color(0XFF808DF1) : (currentStep > 1 ? const Color.fromRGBO(96, 237, 172, .5) :  const Color(0XFFEFF0FD)),
                ),
              ),
              Expanded(
                child: Container(
                    height: 3,
                    color: const Color(0XFFEFF0FD),
                ),
              ),
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: currentStep == 2 ? const Color(0XFF808DF1) : (currentStep > 2 ? const Color.fromRGBO(96, 237, 172, .5) :  const Color(0XFFEFF0FD)),
                ),
              ),
            ],
          ),
        )
    );
  }
}
