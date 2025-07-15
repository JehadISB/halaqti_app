import 'package:flutter/material.dart';
import 'package:halaqti_app/features/auth/presentation/widgets/glass_container.dart';
import 'package:halaqti_app/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/auth_background.jpg"),
                fit: BoxFit.cover),
          ),
          alignment: Alignment.center,
          child: GlassContainer(
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(60),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Center(child: (Text('logo \nhere'))))
                    // child: Image.asset("assets/images/logo.png",height: 80,width: 80,)
                    ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).loginText,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textLabel: S.of(context).textLabelUserName,
                  hintText: S.of(context).hintTextUserName,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  textLabel: S.of(context).textLabelPassword,
                  hintText: S.of(context).hintTextpassword,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      activeColor: Colors.white,
                    ),
                    const Text(
                      "تذكرني",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("تسجيل الدخول"))),
                 Text.rich(TextSpan(children: [
                  TextSpan(text: S.of(context).doseNotHaveAccount),
                  TextSpan(
                      text: S.of(context).navigateCreateNewAccount,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w400))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String textLabel;
  final Widget? prefixIcon;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 8),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white.withAlpha(90))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.white.withAlpha(90),
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
              prefixIcon: prefixIcon),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          cursorColor: Colors.white,
        ),
      ],
    );
  }
}
