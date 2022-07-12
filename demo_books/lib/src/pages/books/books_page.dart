
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {

  String _title = 'title';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: _fab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text('Get Books!!'),
              onPressed: () => serviceLogin('Lord')
            ),
            const SizedBox(height: 50.0),
            Text(_title),
            const SizedBox(height: 20.0),
            _inputText()
          ]
        )
      )
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      child: Icon(Icons.people),
      tooltip: 'Formulario',
      onPressed: () => print('Formulario'), 
    );
  }

  Widget _inputText() {
    return TextFormField(
      onChanged: (value) {
        serviceLogin(value);
      },
    );
  }

  Future<bool> serviceLogin(String value) async {
    const String _host = 'openlibrary.org';
    final Map<String, dynamic> _params = {"q": value};
    final _url = Uri.https(_host, 'search.json', _params);
    // final _url = Uri.parse('https://openlibrary.org/search.json?q=alan poe');
    const _timeOut = Duration(seconds: 30);
    try {
      final _resp = await http.get( 
        _url,
      ).timeout(_timeOut);

      print('--> Resp: ${_resp.body}');
      print('--> Status: ${_resp.statusCode}');

      if(_resp.statusCode == 200) {
        final Map<String, dynamic> _respDecode = jsonDecode(_resp.body);
        setState(() {
          _title = _respDecode["docs"][0]["title"];
        });
        print('--> TODO BIEN');
        return true;
      }else if(_resp.statusCode == 401) {
        print('--> TODO MAL');
        return false;
      }else{
        // SimpleAlert().cAlert('Upss!!', 'Ocurrio un error, intente nuevamente');
        print('Ocurrio un error, intente nuevamente');
        return false;
      }
    } catch (e) {
      // SimpleAlert().cAlert('Upss!!', 'Algo salio mal $e');
      print('Algo salio mal $e');
      return false;
    }
  }

}