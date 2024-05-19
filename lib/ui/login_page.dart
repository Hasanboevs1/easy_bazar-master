import 'package:easy_bazar/data/admin_repository.dart';
import 'package:easy_bazar/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUsername = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();
  List<AdminModel> admins = [];

  @override
  void initState() {
    admins = AdminRepository.adminRepositories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8ecae6),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(100),
              const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.indigo,
                ),
              ),
              const Gap(89),
              TextField(
                controller: controllerUsername,
                textAlign: TextAlign.start,
                maxLength: 30,
                // textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Enter username",
                  hintStyle: TextStyle(
                    color: Colors.indigo,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ),
                  // suffixIcon: Icon(
                  //   Icons.info_outline,
                  //   color: Colors.indigo,
                  // ),
                  // suffixText: "mandatory",
                ),
              ),
              const Gap(15),
              TextField(
                controller: controllerPassword,
                textAlign: TextAlign.start,
                maxLength: 16,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: "Enter password",
                  hintStyle: TextStyle(
                    color: Colors.indigo,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const Gap(250),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 2,
                    color: Colors.indigo,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    String username = controllerUsername.text;
                    String Password = controllerPassword.text;

                    AdminModel? loggedInUser = admins.firstWhereOrNull(
                            (admin) =>
                        admin.adminName == username &&
                            admin.adminPassword == Password);

                    if (loggedInUser != null) {
                      context.push('/adminPage', extra: loggedInUser);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Invalid Username or Password",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
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
