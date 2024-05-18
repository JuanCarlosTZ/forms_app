import 'package:flutter/material.dart';
import 'package:forms_app/presentation/shares/shares.dart';
import 'package:go_router/go_router.dart';

class TraditionalForm extends StatelessWidget {
  const TraditionalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario Tradicional'),
      ),
      body: const _FormView(),
    );
  }
}

class _FormView extends StatefulWidget {
  const _FormView();

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
  late bool formValid;
  final formKey = GlobalKey<FormState>();
  final userFieldKey = GlobalKey<FormFieldState>();
  final emailFieldKey = GlobalKey<FormFieldState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();

  String? user = '';
  String? email = '';
  String? password = '';

  @override
  void initState() {
    super.initState();
    formValid = false;
  }

  validateForm() {
    formValid = false;

    if (userFieldKey.currentState?.isValid == true &&
        emailFieldKey.currentState?.isValid == true &&
        passwordFieldKey.currentState?.isValid == true) {
      formValid = formKey.currentState?.validate() ?? false;
    }

    setState(() {});
  }

  showMessage(BuildContext context) {
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
    return Form(
      key: formKey,
      child: Column(children: [
        CustomInputTextFormField(
          fieldKey: userFieldKey,
          label: 'Usuario',
          onChange: (value) {
            user = value;
            validateForm();
          },
        ),
        CustomInputTextFormField(
          fieldKey: emailFieldKey,
          label: 'Correo electrónico',
          type: CustomInputType.email,
          onChange: (value) {
            email = value;
            validateForm();
          },
        ),
        CustomInputTextFormField(
          fieldKey: passwordFieldKey,
          label: 'Contraseña',
          type: CustomInputType.password,
          isRequired: true,
          onChange: (value) {
            password = value;
            validateForm();
          },
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
