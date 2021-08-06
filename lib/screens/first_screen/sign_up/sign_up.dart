import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/authentication/authentication_services.dart';
import 'package:opaku/logic/sign_up/cubit/sign_up_cubit.dart';

import 'sign_up_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: kPaddingScrollView,
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(context.read<Authentication>()),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}