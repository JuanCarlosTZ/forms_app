import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/form_cubit/form_cubit.dart';
import 'package:forms_app/presentation/shares/form/custom_input_text_form_field.dart';
import 'package:go_router/go_router.dart';

class StateGestureForm extends StatelessWidget {
  const StateGestureForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario y Gestor de Estado'),
      ),
      body: BlocProvider(
        create: (context) => FormCubit(),
        child: const _FormView(),
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView();

  showMessage(BuildContext context) {
    final formState = context.read<FormCubit>().state;

    final password = formState.password;
    final user = formState.user;
    final email = formState.email;
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
              Text('Nombre: $user'),
              Text('Correo: $email'),
              Text('Contraseña: $password'),
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
    final formState = context.watch<FormCubit>().state;

    final formValid = formState.formValid;

    final passwordError = formState.passwordError;
    final userError = formState.userError;
    final emailError = formState.emailError;

    return Form(
      child: Column(children: [
        CustomInputTextFormField(
          fieldKey: null,
          label: 'Usuario',
          onChange: (value) {
            context.read<FormCubit>().onUserChange(value);
          },
          error: userError,
        ),
        CustomInputTextFormField(
          fieldKey: null,
          label: 'Correo electrónico',
          type: CustomInputType.email,
          onChange: (value) {
            context.read<FormCubit>().onEmailChange(value);
          },
          error: emailError,
        ),
        CustomInputTextFormField(
          fieldKey: null,
          label: 'Contraseña',
          type: CustomInputType.password,
          isRequired: true,
          onChange: (value) {
            context.read<FormCubit>().onPasswordChange(value);
          },
          error: passwordError,
        ),
        FilledButton.tonalIcon(
          onPressed: formValid
              ? () {
                  showMessage(context);
                }
              : null,
          icon: const Icon(Icons.save),
          label: const Text('Save'),
        )
      ]),
    );
  }
}
