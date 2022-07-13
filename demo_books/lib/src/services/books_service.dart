
import 'package:demo_books/src/models/books_model.dart';
import 'package:demo_books/src/models/detail_books_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BooksService {

  Future<List<BooksModel>> serviceSearchBooks(String valueParam) async {
  // Future serviceSearchBooks(String valueParam) async {
    const String _host = 'openlibrary.org';
    final Map<String, dynamic> _params = {"title": valueParam};
    // final Map<String, dynamic> _params = {"author": valueParam};
    final _url = Uri.https(_host, 'search.json', _params);
    const _timeOut = Duration(seconds: 30);
    try {
      final _resp = await http.get( _url ).timeout(_timeOut);

      // print('--> Resp: ${_resp.body}');
      print('--> Status: ${_resp.statusCode}');

      if(_resp.statusCode == 200) {
        final Map<String, dynamic> _respDecode = jsonDecode(_resp.body);
        print('--> RESPDECODE: ${_respDecode["docs"]}');
        print('--> TODO BIEN');
        return booksModelFromJson(jsonEncode(_respDecode["docs"]));
      }else{
        // SimpleAlert().cAlert('Upss!!', 'Ocurrio un error, intente nuevamente');
        print('Ocurrio un error, intente nuevamente');
        return [];
      }
    } catch (e) {
      // SimpleAlert().cAlert('Upss!!', 'Algo salio mal $e');
      print('Algo salio mal $e');
      return [];
    }
  }

  Future<DetailBookModel?> serviceDetailBook(String keyParam) async {
    const String _host = 'openlibrary.org';
    final _url = Uri.https(_host, '$keyParam.json');
    const _timeOut = Duration(seconds: 30);
    try {
      final _resp = await http.get( _url ).timeout(_timeOut);

      print('--> Resp: ${_resp.body}');
      print('--> Status: ${_resp.statusCode}');

      if(_resp.statusCode == 200) {
        // final Map<String, dynamic> _respDecode = jsonDecode(_resp.body);
        // print('--> RESPDECODE: ${_respDecode["docs"]}');
        // print('--> TODO BIEN');
        return detailBookModelFromJson(_resp.body);
      }else{
        // SimpleAlert().cAlert('Upss!!', 'Ocurrio un error, intente nuevamente');
        print('Ocurrio un error, intente nuevamente');
        return null;
      }
    } catch (e) {
      // SimpleAlert().cAlert('Upss!!', 'Algo salio mal $e');
      print('Algo salio mal $e');
      return null;
    }
  }

}