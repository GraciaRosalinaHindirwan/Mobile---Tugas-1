import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class AnswerEntity {
  final String question;
  final String answer;


AnswerEntity({
  required this.question,
  required this.answer,
});
}

class AnswerCardComponent extends StatelessWidget{

  final AnswerEntity answerEntity;
  
  const AnswerCardComponent({super.key, required this.answerEntity});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: Card(
        color:AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: AppColors.textColor,
          ),
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  answerEntity.question,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  answerEntity.answer,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        )
      );
  }
}