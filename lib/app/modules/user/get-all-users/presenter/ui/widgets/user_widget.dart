import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String name;
  final String email;
  final String id;
  const UserWidget(
      {super.key, required this.name, required this.email, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              id,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.white),
            ),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColors.white),
            ),
            Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
