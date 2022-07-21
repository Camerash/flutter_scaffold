import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scaffold/core/di/di.dart';
import 'package:flutter_scaffold/features/auth/auth.dart';
import 'package:flutter_scaffold/i18n/translations.g.dart';
import 'package:flutter_scaffold/utils/extensions/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final loading = state is AuthStateLoading;
        final errorMessage = state is AuthStateError ? state.error : null;

        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ReactiveFormBuilder(
                  form: () => FormGroup({
                    'email': FormControl(
                      validators: [
                        Validators.required,
                        Validators.email,
                      ],
                    ),
                    'password': FormControl(
                      validators: [
                        Validators.required,
                        Validators.minLength(6),
                      ],
                    )
                  }),
                  builder: (context, form, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/app_icon_foreground.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          // color: Colors.white,
                          scale: 2,
                        ),
                        const SizedBox(height: 32),
                        ReactiveTextField(
                          formControlName: 'email',
                          validationMessages: (control) => {
                            'required':
                                t.error.fieldEmpty(field: t.common.email),
                            'email': t.error.emailFormat,
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 24,
                              color: Colors.grey,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                            ),
                            hintText: t.common.email,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ReactiveTextField(
                          formControlName: 'password',
                          validationMessages: (control) => {
                            'required':
                                t.error.fieldEmpty(field: t.common.password),
                            'minLength': t.error.passwordLength,
                          },
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 24,
                              color: Colors.grey,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                            ),
                            hintText: t.common.password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ReactiveFormConsumer(
                          builder: (context, form, child) {
                            return ElevatedButton(
                              onPressed: form.valid && !loading
                                  ? () => _onLoginClick(context, form)
                                  : null,
                              child: loading
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(t.login.login),
                            );
                          },
                        ),
                        if (errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: _onForgotPasswordClick,
                          child: Text(
                            t.login.forgotPassword,
                            style: Theme.of(context).getPrimaryBodyBoldText(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(t.login.noAccount),
                            const SizedBox(width: 2),
                            InkWell(
                              onTap: () => _onCreateAccountClick(context),
                              // onTap: () {getIt<AuthCubit>().logout();},
                              child: Text(
                                t.login.createANewAccount,
                                style:
                                    Theme.of(context).getPrimaryBodyBoldText(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onLoginClick(BuildContext context, FormGroup form) {
    if (!form.valid) return;
    final formValue = form.value;
    context.read<AuthCubit>().login(
          email: formValue['email']! as String,
          password: formValue['password']! as String,
        );
  }

  void _onForgotPasswordClick() {
    // TODO:
  }

  void _onCreateAccountClick(BuildContext context) {
    // FIXME:
  }
}
