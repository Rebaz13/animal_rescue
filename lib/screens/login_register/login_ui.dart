import 'package:flutter/material.dart';
import './register_ui.dart';

class LoginUi extends StatelessWidget {
  LoginUi({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const route = 'log-in';
  final _formKey = GlobalKey<FormState>();
  Widget Textfield(TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.only(left: 0),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter your email!';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          // border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: 'E-mail',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Icon(
                Icons.pets_sharp,
                size: 100,
                color: Colors.orange[800],
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.jobTitle),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Textfield(emailController),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' please enter password';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                      ),
                      labelText: 'Password',
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 15),
                      )),
                )
              ]),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('logged in')));
                  }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(370, 65)),
                child: const Text('Sign in'),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: 10,
                    width: 120,
                    child: Divider(
                      height: 2,
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                  ),
                  const Text(
                    'Or Continue with',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 10,
                    width: 120,
                    child: Divider(
                      height: 2,
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.g_mobiledata_outlined,
                          size: 70,
                          color: Colors.orange[900],
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member ?',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterUi()));
                      },
                      child: const Text('Register Now',
                          style: TextStyle(fontSize: 16)))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
