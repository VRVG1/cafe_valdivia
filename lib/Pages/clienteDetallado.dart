import 'package:cafe_valdivia/Components/CustomTextField.dart';
import 'package:cafe_valdivia/Pages/editarClienteDetallada.dart';
import 'package:flutter/material.dart';

class ClienteDetallado extends StatefulWidget {
  const ClienteDetallado({super.key}) : super();
  @override
  _ClienteDetalladoState createState() => _ClienteDetalladoState();
}

class _ClienteDetalladoState extends State<ClienteDetallado> {
  final TextEditingController _nombreController = TextEditingController(
    text: "Vicente",
  );
  final TextEditingController _apellidoController = TextEditingController(
    text: "Valdivia",
  );
  final TextEditingController _telefonoController = TextEditingController(
    text: "3411053960",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "ejemplo@ejemplo.com",
  );
  final TextEditingController _kilosController = TextEditingController(
    text: "100",
  );

  final TextEditingController _ventasController = TextEditingController(
    text: "2800",
  );
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombre del Cliente"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarClienteDetallado(),
                    ),
                  ),
                },
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () => {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: CircleAvatar(
                backgroundColor: theme.colorScheme.secondaryContainer,
                radius: 64,
                child: Text(
                  "V",
                  style: TextStyle(
                    fontSize: 64,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CustomTextField(
                      labelText: "Nombre",
                      controller: _nombreController,
                      onChanged: (value) {},
                      readOnly: true,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CustomTextField(
                      labelText: "Apellido",
                      controller: _apellidoController,
                      onChanged: (value) {},
                      readOnly: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: CustomTextField(
                prefixIcon: Icons.phone,
                labelText: "Telefono",
                controller: _telefonoController,
                onChanged: (value) {},
                readOnly: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: CustomTextField(
                prefixIcon: Icons.email,
                labelText: "Email",
                controller: _emailController,
                onChanged: (value) {},
                readOnly: true,
              ),
            ),
            Row(
              children: [
                Card(
                  elevation: 0,
                  color: theme.colorScheme.surface,
                  child: Text(
                    "Ventas",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CustomTextField(
                      labelText: "Kilos",
                      suffixText: "KG",
                      controller: _kilosController,
                      onChanged: (value) {},
                      readOnly: true,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CustomTextField(
                      labelText: "Ventas",
                      prefixIcon: Icons.attach_money,
                      controller: _ventasController,
                      onChanged: (value) {},
                      readOnly: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
