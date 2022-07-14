
import 'package:demo_books/src/models/books_model.dart';
import 'package:demo_books/src/widgets/alerts/simple_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo_books/src/utils/utils.dart' as utils;

class BooksService {

  final String _host = 'openlibrary.org';

  //==========================================================
  /// COSNUME EL ENDPOINT PARA BUSCAR LIBROS POR NOMBRE O AUTOR
  //==========================================================
  Future<List<BooksModel>> serviceSearchBooks(bool byTitle, String valueParam) async {
    final Map<String, dynamic> _paramsTitle  = {"title": valueParam};
    final Map<String, dynamic> _paramsAuthor = {"author": valueParam};
    final _url = Uri.https( _host, 'search.json', (byTitle) ? _paramsTitle : _paramsAuthor );
    const _timeOut = Duration(seconds: 30);
    try {
      utils.msginfo('Service Buscando libros...');
      final _resp = await http.get( _url ).timeout(_timeOut);

      // print('--> Resp: ${_resp.body}');
      // print('--> Status: ${_resp.statusCode}');

      if(_resp.statusCode == 200) {
        final Map<String, dynamic> _respDecode = jsonDecode(_resp.body);
        return booksModelFromJson(jsonEncode(_respDecode["docs"]));
      }else{
        SimpleAlert().cAlert('Upss!!', 'Ocurrio un error, intente nuevamente');
        return [];
      }
    } catch (e) {
      SimpleAlert().cAlert('Upss!!', 'Algo salio mal $e');
      // print('Algo salio mal $e');
      return [];
    }
  }

}