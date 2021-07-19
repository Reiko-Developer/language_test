import 'package:flutter/material.dart';
import 'package:language_test/dialog/game_dialog/end_game_dialog.dart';
import 'package:language_test/performance/foo.dart';
import 'package:language_test/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          width: 360,
          height: 740,
          color: Colors.white,
          child: const Foo(),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  process(String s, bool isWidthProcessing, double value) {
    // s = s.replaceAll(' ', '');
    //Mus receive a one line text.
    //Tool to join lines:
    ///[https://www.browserling.com/tools/join-lines]
    //Leitura da expressão regular: RegExp(r'[-]?size.width[\*]?[-]?\d*(\.[\d]+)?')
    // r'' => rawString
    //
    // Busca por um texto:
    // [-]? => iniciando ou não com "-"
    // size.width => seguido por "size.width"
    // [\*]? => seguido ou não por 1 "*"
    // [-]? => seguido ou não por 1 "-",
    // \d* => seguido por nenhum ou vários números,
    // (\.[\d]+)? => seguido ou não por um "." seguido de 1 ou mais números.
    //
    //  IMPORTANTE: para adicionar grupos de resultado à expressão regular adicione parênteses à expressão.
    // Ex: RegExp(r'[-]?size.width([\*]?[-]?\d*(\.[\d]+)?)');
    // Nesse caso a expressão regular vai retornar mais um grupo contendo o valor encontrado depois de width até o final da String de retorno.
    // Exemplos de valores para o novo grupo: "", *0, "* .6219", "-.232" ..............
    //
    //more info:
    //https://medium.com/flutter-community/extracting-text-from-a-string-with-regex-groups-in-dart-b6be604c8a69
    //
    // final regex = RegExp(r'[-]?size.width[ ]*[\*]?[ ]*[-]?\d*(\.[\d]+)?');

    late final RegExp regex;
    if (isWidthProcessing)
      regex = RegExp(r'[-]?size.width[ ]*[\*]?[ ]*[-]?\d*(\.[\d]+)?');
    else
      regex = RegExp(r'[-]?size.height[ ]*[\*]?[ ]*[-]?\d*(\.[\d]+)?');

    String newS = s.replaceAllMapped(regex, (match) {
      return multiply(match.group(0)!, value);
    });

    newS = newS.replaceAll('//', '\n//');

    return newS;
  }

  ///The string can start with "-" and has to be followed by "size.width".
  ///Can be followed too by "*" and a decimal number like "0.01" or "-.1"
  multiply(String string, double num) {
    final vect = string.split(' ');
    late final String result;
    //is like: -size.width || size.height
    if (vect.length == 1) {
      result = '$string * $num';
    } else
    //is like -size.width * .3
    if (vect.length == 3) {
      double parsed = double.parse(vect[2]);
      parsed *= num;
      result = "${vect[0]} * ${parsed}";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print(process(firstString, true, 10));

    return Center(
      child: Container(
        color: Colors.black87,
      ),
    );
  }
}
