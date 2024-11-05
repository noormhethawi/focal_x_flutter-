import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '/core/class/check_internet.dart';
import '/core/class/status_req.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String link, Map body, Map<String, String> headers) async {
    try {
      if (await CheckInternet()) {
        var responce = await http.post(Uri.parse(link),
            body: jsonEncode(body), headers: headers);
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          Map reponceBody = jsonDecode(responce.body);
          print(reponceBody);
          return Right(reponceBody);
        } else {
          return const Left(StatusRequest.serverfailer);
        }
      } else {
        return left(StatusRequest.Offlinefailer);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailer);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
      String link, Map<String, String> headers) async {
    try {
      if (await CheckInternet()) {
        var responce = await http.get(Uri.parse(link), headers: headers);
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          Map reponce_body = jsonDecode(responce.body);
          print(reponce_body);
          return Right(reponce_body);
        } else {
          return Left(StatusRequest.serverfailer);
        }
      } else {
        return left(StatusRequest.Offlinefailer);
      }
    } catch (e) {
      return Left(StatusRequest.serverfailer);
    }
  }
}
