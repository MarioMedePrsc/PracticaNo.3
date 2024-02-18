import 'package:flutter/material.dart';
//Widget para la Barra superior
class barraApp extends StatelessWidget {
  const barraApp({super.key, required this.lblnombreApp});
  final String lblnombreApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.teal,
        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child:
          Center(
            child: Text(lblnombreApp, style: TextStyle(fontSize: 24, color: Colors.white),),
          ),
    );
  }
}
//Widget para colocar letras grandes
class MyTextResult extends StatelessWidget {
  MyTextResult({super.key, required this.lblText});
  String lblText;

  @override
  Widget build(BuildContext context) {
    return Text(
        lblText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
    );
  }
}
//Widget Container principal
class ContainerPrincipal extends StatelessWidget {
  const ContainerPrincipal({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height + 50,
      //padding: EdgeInsets.only(bottom: 50),

      child: child,
      //margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 204, 202, 202).withOpacity(0.2),
        ),
    );
  }
}

//Widget para ingresar la cantidad de grados
class InputGrados extends StatelessWidget {
  const InputGrados({super.key, required this.labelTexto, required this.InputGradosController});
  final TextEditingController InputGradosController;
  final String labelTexto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: 60,
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: InputGradosController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          //prefixIcon: Icon(Icons.grade),
          labelStyle:TextStyle(fontSize: 15, color: Colors.black54),
          labelText: labelTexto,
        ),
      ),
    );
  }
}



//Widget para seleccionar tipo de grados
class InputTipoGrados extends StatelessWidget {
  const InputTipoGrados({super.key, required this.tipeGrado, required this.funcion});

  //final TextEditingController InputTipoGradosController;
  final Function(String) funcion;
  final String tipeGrado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: 60,
      margin: EdgeInsets.all(10),
      alignment: Alignment.bottomCenter,
      child: DropdownButton(
          items: const [
            DropdownMenuItem(child: Text('Celsius', style: TextStyle(fontSize: 15),), value: "Celsius",),
            DropdownMenuItem(child: Text('Farenheit',style: TextStyle(fontSize: 15),), value: "Farenheit",),
            DropdownMenuItem(child: Text('Kelvin',style: TextStyle(fontSize: 15),), value: "Kelvin",),
          ],

        value: tipeGrado,
        onChanged: (value) => funcion(value.toString()),
        iconSize: 60,

      ),

    );

  }
}

class cajaResultado extends StatelessWidget {
  const cajaResultado({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: 60,
      margin: EdgeInsets.all(10),
      child:
      Align(
        alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Resultado:", style: TextStyle(
            fontSize: 15,
          ),),
          Text(result, style: TextStyle(
            fontSize: 20,
          ),),
          ],
        ),
      ),
    );
  }
}

//Boton para Calcular
class BtnCalcular extends StatelessWidget {
  const BtnCalcular({super.key, required this.lblText, required this.calcular});

  final String lblText;
  final VoidCallback calcular;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: calcular,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        child: Text(lblText, style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,
        ),));
  }
}


