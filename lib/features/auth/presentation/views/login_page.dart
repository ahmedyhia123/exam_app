import 'package:exam_app/core/DI/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/view_model/cubit/signin_cubit.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SigninCubit>(
      create: (context) => getIt.get<SigninCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: AppColors.black),
          title: Text(
            AppLocalizations.of(context)!.login,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
