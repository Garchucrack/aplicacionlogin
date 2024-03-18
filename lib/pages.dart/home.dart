
import 'package:dart_application_login/routes.dart/myroutes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.png.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background-2.png.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background-2.png.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.red)), // Cambio de color a rojo
                      ),
                      child: TextField(
                        controller: emailController,
                        maxLength: 30,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.red), // Cambio de color a rojo
                          icon: Icon(Icons.email, color: Colors.red), // Cambio de color a rojo
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Custompass(
                      controller: passwordController,
                      obscureText: true,
                    ),
                  ),
                  PrimaryButton(
                    text: 'Iniciar Sesión',
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          emailController.text != 'joanlaguna.@unah.hn' ||
                          passwordController.text != '12345678') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('El correo o/ambos la contraseña no son correctos.')),
                        );
                        return;
                      } else if (emailController.text == 'joanlaguna.@unah.hn' &&
                          passwordController.text == '12345678') {
                        Navigator.pushNamed(context, MyRoutes.inicio.name);
                      }
                    },
                  ),
                  SecondaryButton(
                    text: 'Registro',
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.registro.name);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.white, // color de fondo
        foregroundColor: Colors.red, // color de texto
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({Key? key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.red)),
    );
  }
}

class Custompass extends StatefulWidget {
  const Custompass({
    Key? key,
    required this.controller,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final bool obscureText;

  @override
  State<Custompass> createState() => _CustomInputState();
}

class _CustomInputState extends State<Custompass> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text('Password', style: TextStyle(color: Colors.red)),
        prefixIcon: Icon(Icons.lock, color: Colors.red),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.red),
        ),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}