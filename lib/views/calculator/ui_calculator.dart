import 'package:flutter/material.dart';
import 'package:conversor_de_grados_p03/views/calculator/widgets/widgets.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  TextEditingController _grados = TextEditingController();
  String _tGrados = "Celsius";
  String _tipoConvertirGrados = "Celsius";
  String resultado = "0";
  //Funciones para actualizar dropdowns
  void _dropDownConvertir( String val){
    print(val);
    setState(() {
      _tGrados = val;
    });
  }
  void _dropDownResultado( String val){
    print(val);
    setState(() {
      _tipoConvertirGrados = val;
    });
  }
  //Función para calcular
  void _calcular(){
    setState(() {
      if(_grados.text.trim().isNotEmpty){
        print("Campo con variable");
        double gradosIniciales = double.parse(_grados.text);
        double result = 0;
        if(_tGrados == _tipoConvertirGrados){
          resultado = gradosIniciales.toString();
        }else{
          switch(_tGrados){
            case "Celsius":
              if(_tipoConvertirGrados=="Farenheit"){
                result = (gradosIniciales * (9/5))+32;
              }else{
                result = gradosIniciales + 273.15;
              }
              break;
            case "Farenheit":
              if(_tipoConvertirGrados=="Celsius"){
                result = (gradosIniciales - 32) * (5/9);
              }else{
                result = (gradosIniciales - 32) * (5/9) + 273.15;
              }
              break;
            case "Kelvin":
              if(_tipoConvertirGrados=="Celsius"){
                result = gradosIniciales - 273.15;
              }else{
                result = (gradosIniciales - 273.15) * (9/5) + 32;
              }
              break;
          }
          resultado = double.parse(result.toStringAsFixed(5)).toString();
        }
        //Condicional para quitar punto decimal cuando termine en .0
        if (resultado.endsWith('.0')){
          resultado = resultado.substring(0,resultado.length - 2);
        }
      }else{
        print("Campo Vacío");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Practica #3 Conversor de Grados'),),
      ),
      body: SingleChildScrollView(
        child: ContainerPrincipal(
          child: Column(
            children: [
              Stack(
                children: [
                  barraApp(lblnombreApp: "Equipo #2"),
                ],
              ),
              _sizeEspacio(),
              MyTextResult(lblText: "Conversor de grados Celsius, Farenheit y Kelvin",),
              _sizeEspacio(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InputGrados(InputGradosController: _grados, labelTexto: "º Grados a convertir"),
                  InputTipoGrados(tipeGrado: _tGrados,funcion: _dropDownConvertir,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cajaResultado(result: resultado),
                  //InputGrados(InputGradosController: _resultadoGrados, labelTexto: "º Resultado:"),
                  InputTipoGrados(tipeGrado: _tipoConvertirGrados,funcion: _dropDownResultado,),
                  ],
              ),
              _sizeEspacio(),
              BtnCalcular(lblText: "Convertir Grados", calcular: _calcular),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sizeEspacio(){
  return SizedBox(height: 30,);
}
