import 'package:cafe_valdivia/Components/CustomTextField.dart';
import 'package:cafe_valdivia/Pages/editarVentaDetallada.dart';
import 'package:flutter/material.dart';

class Ventadetallada extends StatefulWidget {
  const Ventadetallada({super.key}) : super();
  @override
  _VentadetalladaState createState() => _VentadetalladaState();
}

class _VentadetalladaState extends State<Ventadetallada> {
  final TextEditingController _dateController = TextEditingController(
    text: "10/10/2020",
  );
  // final DateTime _selectedDate = DateTime.now();
  // final String _kilos = "500";
  // String? _monto = "520";

  final TextEditingController _montoController = TextEditingController(
    text: "520",
  );
  final TextEditingController _kilosController = TextEditingController(
    text: "2",
  );

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );

  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //       print(picked);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Vicente Valdivia"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Editarventadetallada(),
                    ),
                  ),
                },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {print("Menu options")},
          ),
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
              onTap: () => print(_dateController.text),
              readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
                      labelText: "Monto",
                      prefixIcon: Icons.attach_money,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: theme.colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          "Detalles",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "Venta en la tienda de Vicente",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    theme.colorScheme.tertiaryContainer,
                  ),
                ),
                child: Text(
                  "Pagado",
                  style: TextStyle(
                    color: theme.colorScheme.onTertiaryContainer,
                  ),
                ),
                onPressed: () => {print("Si")},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
