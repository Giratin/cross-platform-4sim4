import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String? _username;
  late String? _password;
  late String? _email;
  late String? _annee;
  late String? _address;

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Username is required!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _username = value;
                },
                // onChanged: (String? value) {
                //   _username = value!;
                //   print(_username!);
                // },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Email is required!";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please provide correct email!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _email = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Password is required!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _password = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Année de naissance"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Birth Year is required!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _annee = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse de facturation"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Billing address is required!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _address = value;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("S'inscrire"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("UserInfo"),
                              content: Text("Email is: " +
                                  _email! +
                                  "\nUsername is: " +
                                  _username! +
                                  "\nPassword is: " +
                                  _password! +
                                  "\nBirth Year is: " +
                                  _annee! +
                                  "\nBilling Address is: " +
                                  _address!),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Cancel",
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Confirm")),
                              ],
                            );
                          });
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Annuler"),
                  onPressed: () {
                    formKey.currentState!.reset();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
