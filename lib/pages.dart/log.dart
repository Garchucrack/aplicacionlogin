import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key});

  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final telController = TextEditingController();
  final apellidoController = TextEditingController();
  final passwordController = TextEditingController();
  final confipasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      backgroundColor: Colors.black, 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    _buildInputField(
                      controller: nombreController,
                      label: 'Nombre',
                      icon: Icons.person,
                      keyboardType: TextInputType.text,
                    ),
                    _buildInputField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _buildInputField(
                      controller: passwordController,
                      label: 'Contraseña',
                      icon: Icons.password,
                      keyboardType: TextInputType.text,
                    ),
                    _buildInputField(
                      controller: confipasswordController,
                      label: 'Confirmar contraseña',
                      icon: Icons.password,
                      keyboardType: TextInputType.text,
                    ),
                    _buildInputField(
                      controller: telController,
                      label: 'Teléfono',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            print('Nombre: ' + nombreController.text);
            print('Gmail: ' + emailController.text);
            print('Contrasena: ' + passwordController.text);
            print('Telefono: ' + telController.text);
  
          }
        },
        child: const Icon(Icons.clear),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required TextInputType keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLength: label == 'Teléfono' ? 10 : label == 'Contraseña' || label == 'Confirmar contraseña' ? 20 : 40,
        validator: (value) {
          if (value!.isEmpty) {
            return 'El $label es obligatorio';
          }
          if (label == 'Confirmar contraseña' && confipasswordController.text != passwordController.text) {
            return 'Las contraseñas no coinciden';
          }
          return null;
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.red), 
          icon: Icon(icon, color: Colors.red), 
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}