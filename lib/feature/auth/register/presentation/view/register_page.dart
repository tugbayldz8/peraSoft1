import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pera_soft1/feature/auth/register/data/models/register_request_model.dart';
import 'package:pera_soft1/feature/auth/register/presentation/bloc/register_bloc.dart';
import 'package:pera_soft1/feature/home/presentation/view/index.dart';
import 'package:pera_soft1/feature/list/index.dart';
import 'package:pera_soft1/product/widgets/text_field/auth_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? validator(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return 'Bu alan boş bırakılamaz!';
    } else {
      return null;
    }
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return 'Bu alan boş bırakılamaz!';
    } else if (!RegExp(r"[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
        .hasMatch(value)) {
      return 'Geçerli bir E-mail giriniz!';
    } else {
      return null;
    }
  }

  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordAgainController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordAgainController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthTextField(
                validator: validator,
                controller: nameController,
                hintText: 'Ad Soyad',
              ),
              const SizedBox(height: 20),
              AuthTextField(
                validator: validatorEmail,
                controller: emailController,
                hintText: 'E-posta',
              ),
              const SizedBox(height: 20),
              AuthTextField(
                validator: validator,
                controller: passwordController,
                hintText: 'Şifre',
              ),
              const SizedBox(height: 20),
              AuthTextField(
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Şifreler uyuşmuyor!';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordAgainController,
                  hintText: 'Şifre Tekrar'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    context.read<RegisterBloc>().add(
                          SignInWithEmailAndPasswordEvent(
                            model: RegisterRequestModel(
                              fullName: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                  },
                  child: const Text('Kaydol')),
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  if (state.model?.error != null) {
                    return Text(state.model!.error!);
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
