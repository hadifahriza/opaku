import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
   '[a-zA-Z]',
  );

  @override
  NameValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : NameValidationError.invalid;
  }

}