import 'dart:io';

import 'package:dio/dio.dart';
import 'package:yes_no_app/config/helpers/helpers.dart';
import 'package:yes_no_app/domain/entitis/answer.dart';

class GetYesNoAnswer {
  static final _dio = Dio();

  Future<AnswerDto> getAnswer() async {
    final response = await _dio.get(Helpers.urlApi);
    if (response.statusCode == HttpStatus.ok) {
      return AnswerDto.fromJsonMap(response.data);
    }
    throw UnimplementedError();
  }
}
