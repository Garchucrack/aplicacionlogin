import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> chats = [
    {
      "nombre": "Juanes",
      "mensaje": "¿Tengo la camisa negra xd?",
      "hora": "11:00",
      "foto": FlutterLogo(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensajes'),
      ),
      backgroundColor: Colors.black, 
      body: chats.isEmpty
          ? Center(
              child: Text(
                'No hay mensajes',
                style: TextStyle(color: Colors.red), 
              ),
            )
          : ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ItemChat(
                  nombre: chats[index]['nombre']!,
                  mensaje: chats[index]['mensaje']!,
                  hora: chats[index]['hora']!,
                  foto: chats[index]['foto'] as Widget,
                );
              },
            ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.nombre,
    required this.mensaje,
    required this.hora,
    required this.foto,
  }) : super(key: key);

  final String nombre;
  final String mensaje;
  final String hora;
  final Widget foto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        color: Colors.black, // Fondo de la tarjeta en negro
        child: ListTile(
          title: Text(
            nombre,
            style: TextStyle(color: Colors.red), 
          ),
          subtitle: Text(
            mensaje,
            style: TextStyle(color: Colors.red), 
          ),
          leading: CircleAvatar(child: foto),
          trailing: Text(
            hora,
            style: TextStyle(color: Colors.red), 
          ),
        ),
      ),
    );
  }
}