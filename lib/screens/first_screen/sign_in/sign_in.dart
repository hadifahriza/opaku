import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/authentication/authentication_services.dart';
import 'package:opaku/logic/sign_in/cubit/sign_in_cubit.dart';

import 'sign_in_form.dart';

class SignIn extends StatelessWidget {
  const SignIn({ Key? key }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SignIn());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: kPaddingScrollView,
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<Authentication>()),
          child: const SignInForm(),
        ),
      ),
    );
  }
}