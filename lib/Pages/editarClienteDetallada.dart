import 'package:cafe_valdivia/Components/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditarClienteDetallado extends StatefulWidget {
  const EditarClienteDetallado({super.key}) : super();
  @override
  _EditarClienteDetalladoState createState() => _EditarClienteDetalladoState();
}

class _EditarClienteDetalladoState extends State<EditarClienteDetallado> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _kilosController = TextEditingController();
  final TextEditingController _ventasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //String? _nombre;
  //String? _apellido;
  String? _telefono;
  String? _email;
  String? _kilos;
  String? _ventas;

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores con los valores
    _nombreController.text = "Gregory";
    _apellidoController.text = "House";
    _telefonoController.text = "1234567890";
    _emailController.text = "prueba@prueba.com";
    _kilosController.text = "9999";
    _ventasController.text = "12999012";
  }

  @override
  void dispose() {
    //_nombreController.dispose();
    //_apellidoController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    _kilosController.dispose();
    _ventasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombre del Cliente"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: () => {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () => {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        readOnly: false,
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
                        readOnly: false,
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
                  readOnly: false,
                  errorText: _telefono,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un telefono';
                    }
                    if (RegExp(r'^\d{11}$').hasMatch(value)) {
                      return 'Por favor ingrese un telefono valido';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: CustomTextField(
                  prefixIcon: Icons.email,
                  labelText: "Email",
                  controller: _emailController,
                  onChanged: (value) {},
                  readOnly: false,
                  errorText: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese el correo';
                    }
                    if (!RegExp(
                      r'^[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}$',
                    ).hasMatch(value)) {
                      return 'Debe ser un coreo valido';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: [
                  Card(
                    elevation: 0,
                    color: theme.colorScheme.surface,
                    child: Text(
                      "Ventas",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                        readOnly: false,
                        errorText: _kilos,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese los kilos';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Debe ser un número válido';
                          }
                          if (double.parse(value) < 0) {
                            return "No puede ser negativo";
                          }
                          return null;
                        },
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
                        readOnly: false,
                        errorText: _ventas,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese el monto';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Debe ser un número válido';
                          }
                          if (double.parse(value) < 0) {
                            return "No puede ser negativo";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
