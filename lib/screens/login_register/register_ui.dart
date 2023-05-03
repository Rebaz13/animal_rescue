import 'package:flutter/material.dart';
import './login_ui.dart';

class RegisterUi extends StatelessWidget {
  RegisterUi({super.key});
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Widget passwordTextField(TextEditingController passController, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.only(left: 0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            labelText: title,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.orange,
            )),
          )),
    );
  }

  Widget textField(TextEditingController controller, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.only(left: 0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
          )),
          labelText: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Icon(
              Icons.pets_sharp,
              size: 100,
              color: Colors.orange[800],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
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
            textField(fullNameController, 'Full-name'),
            textField(emailController, 'E-mail'),
            passwordTextField(passwordController, 'password'),
            passwordTextField(confirmPasswordController, 'Confirm password'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(fixedSize: const Size(370, 65)),
              child: const Text('Create account'),
            ),
            const SizedBox(
              height: 40,
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
              height: 20,
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have account ?',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginUi()));
                    },
                    child:
                        const Text('Sign in', style: TextStyle(fontSize: 16)))
              ],
            )
          ],
        ),
      )),
    );
  }
}
