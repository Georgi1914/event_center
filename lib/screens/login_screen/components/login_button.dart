import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../login_view_model.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.maxFinite,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: AppColors.primaryPurple,
            disabledBackgroundColor: AppColors.neutralsGray,
          ),
          onPressed: () async {
            await viewModel.signIn()
                ? Navigator.pushReplacementNamed(
                    context,
                    RouteManager.navigation,
                    arguments: true,
                  )
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.invalidCredentials),
                    ),
                  );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              AppStrings.signIn,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
