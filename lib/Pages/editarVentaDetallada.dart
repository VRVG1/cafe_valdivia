import 'package:flutter/material.dart';
import 'package:cafe_valdivia/Components/custom_text_field.dart';
import 'package:intl/intl.dart';

class Editarventadetallada extends StatefulWidget {
  const Editarventadetallada({super.key}) : super();

  @override
  EditarventadetalladaState createState() => EditarventadetalladaState();
}

class EditarventadetalladaState extends State<Editarventadetallada> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _kilosController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _detallesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _dateError;
  String? _kilosError;
  String? _montoError;
  String? _detallesError;

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores con los valores existentes
    _dateController.text = DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now()); // Valor por defecto: fecha actual formateada
    _kilosController.text = "0"; // Valor por defecto
    _montoController.text = "0"; // Valor por defecto
    _detallesController.text = "Detalles"; // Valor por defecto
  }

  @override
  void dispose() {
    _dateController.dispose();
    _kilosController.dispose();
    _montoController.dispose();
    _detallesController.dispose();
    super.dispose();
  }

  // Función para mostrar un diálogo de error
  void _mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(mensaje),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ok'),
              ),
            ],
          ),
    );
  }

  // Funciones de logica
  void _guardar() {
    setState(() {
      // Agregamos setState aquí
      if (_formKey.currentState!.validate()) {
        // Solo se ejecuta si el formulario es válido
        print('Guardar');
        print('Fecha: ${_dateController.text}');
        print('Kilos: ${_kilosController.text}');
        print('Monto: ${_montoController.text}');
        print('Detalles: ${_detallesController.text}');
        // Puedes guardar los cambios y volver a la pantalla anterior
        Navigator.of(context).pop();
      } else {
        // Muestra un diálogo de error si la validación falla
        _mostrarError('Por favor, corrija los errores en el formulario.');
      }
    });
  }

  // Salir
  void _salir(BuildContext context) {
    if (_dateController.text !=
            DateFormat('dd/MM/yyyy').format(DateTime.now()) ||
        _kilosController.text != "0" ||
        _montoController.text != "0" ||
        _detallesController.text != "Detalles") {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: const Text("No se han guardado tus cambios"),
              actions: [
                TextButton(
                  child: const Text("Descartar"),
                  onPressed: () {
                    Navigator.of(context).pop(); // Cerrar el dialog
                    Navigator.of(context).pop(); // Cerrar edicion sin guardar
                  },
                ),
                TextButton(
                  child: const Text("Guardar"),
                  onPressed: () {
                    // Agregar el guardado
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => _salir(context),
        ),
        title: Text('Editar Vicente'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: ElevatedButton(
              child: Text('Guardar'),
              onPressed: () => _guardar(),
            ),
          ),
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
                  backgroundColor: theme.colorScheme.tertiaryContainer,
                  radius: 64,
                  child: Text(
                    "V",
                    style: TextStyle(
                      fontSize: 64,
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              CustomTextField(
                controller: _dateController,
                labelText: "Fecha",
                prefixIcon: Icons.calendar_today,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    String formattedDate = DateFormat(
                      'dd/MM/yyyy',
                    ).format(pickedDate);
                    _dateController.text = formattedDate;
                  }
                },
                readOnly: true,
                errorText: _dateError,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la fecha';
                  }
                  if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(value)) {
                    return 'Formato de fecha incorrecto (dd/MM/yyyy)';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20, right: 8),
                      child: CustomTextField(
                        controller: _kilosController,
                        keyboardType: TextInputType.number,
                        labelText: "Kilos",
                        suffixText: "KG",
                        readOnly: false,
                        errorText: _kilosError,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese los kilos';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Debe ser un número válido';
                          }
                          if (double.parse(value) < 0) {
                            return 'No puede ser negativo';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 8),
                      child: CustomTextField(
                        controller: _montoController,
                        keyboardType: TextInputType.number,
                        labelText: "Monto",
                        prefixIcon: Icons.attach_money,
                        readOnly: false,
                        errorText: _montoError,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese el monto';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Debe ser un número válido';
                          }
                          if (double.parse(value) < 0) {
                            return 'No puede ser negativo';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: CustomTextField(
                        controller: _detallesController,
                        labelText: "Detalles",
                        errorText: _detallesError,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese los detalles';
                          }
                          return null;
                        },
                        onChanged: (value) {},
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
