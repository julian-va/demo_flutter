import 'dart:ffi';

class AnswerDto {
  final String answer;
  final bool? forced;
  final String image;

  AnswerDto({required this.answer, this.forced, required this.image});

  factory AnswerDto.fromJsonMap(Map<String, dynamic> json) => AnswerDto(
      answer: json['answer'], image: json['image'], forced: json['forced']);
}
