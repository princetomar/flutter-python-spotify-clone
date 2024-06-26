import 'package:flutter/material.dart';
import 'package:listener/src/core/theme/app_pallete.dart';
import 'package:listener/src/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:listener/src/presentation/molecules/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hintText: "Your Email",
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                isObsecureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthGradientButton(
                onPressed: () {},
                buttonText: "Sign Up",
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
