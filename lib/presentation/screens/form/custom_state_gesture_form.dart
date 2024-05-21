import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/formz_cubit/formz_cubit.dart';
import 'package:forms_app/presentation/shares/form/custom_input_text_form_field.dart';
import 'package:go_router/go_router.dart';

class CustomStateGestureForm extends StatelessWidget {
  const CustomStateGestureForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Formulario de Registro'),
      ),
      body: BlocProvider(
        create: (context) => FormzCubit(),
        child: const _FormView(),
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView();

  showMessage(BuildContext context) {
    final formState = context.read<FormzCubit>().state;

    final password = formState.password.value;
    final user = formState.username.value;
    final email = formState.email.value;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Autenticacion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Usuario registrado satisfactoriamente',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              user.isEmpty ? const SizedBox() : Text('Nombre: $user'),
              email.isEmpty ? const SizedBox() : Text('Correo: $email'),
              password.isEmpty
                  ? const SizedBox()
                  : Text('Contraseña: $password'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formState = context.watch<FormzCubit>().state;

    final passwordError = formState.passwordError;
    final userError = formState.userError;
    final emailError = formState.emailError;

    return Form(
      child: Column(children: [
        const SizedBox(height: 40),
        const FlutterLogo(size: 100),
        const SizedBox(height: 10),
        CustomInputTextFormField(
          fieldKey: null,
          label: 'Usuario',
          isRequired: formState.username.isRequired,
          onChange: (value) {
            context.read<FormzCubit>().onUserChange(value);
          },
          error: userError == '' ? null : userError,
        ),
        CustomInputTextFormField(
          fieldKey: null,
          label: 'Correo electrónico',
          isRequired: formState.email.isRequired,
          type: CustomInputType.email,
          onChange: (value) {
            context.read<FormzCubit>().onEmailChange(value);
          },
          error: emailError == '' ? null : emailError,
        ),
        CustomInputTextFormField(
          fieldKey: null,
          label: 'Contraseña',
          isRequired: formState.password.isRequired,
          type: CustomInputType.password,
          onChange: (value) {
            context.read<FormzCubit>().onPasswordChange(value);
          },
          error: passwordError == '' ? null : passwordError,
        ),
        FilledButton.tonalIcon(
          onPressed: formState.formValid
              ? () {
                  showMessage(context);
                }
              : null,
          icon: const Icon(Icons.save),
          label: const Text('Guardar usuario'),
        )
      ]),
    );
  }
}
