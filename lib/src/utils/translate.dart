import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translator/translator.dart';

class Translate {
  static exchangeLanguages(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);

    String from = appState.languageFrom;
    String to = appState.languageTo;
    appState.languageFrom = to;
    appState.languageTo = from;
  }

  static translator(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) async {
    final appState = Provider.of<AppProvider>(context);
    if (appState.currentText != '') {
      appState.loading = true;
      GoogleTranslator translator = new GoogleTranslator();

      appState.translatedText = await translator.translate(
        appState.currentText,
        from: appState.languageFrom,
        to: appState.languageTo,
      );
      appState.loading = false;
    } else {
     scaffoldKey.currentState.showSnackBar(
         SnackBar(
           content: Text('Error! write a text'),
         ),

     );
    }


  }
}
