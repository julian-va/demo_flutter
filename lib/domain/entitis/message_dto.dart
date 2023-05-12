enum FromWho { mine, others }

class MessageDto {
  final String text;
  final String? imgUrl;
  final FromWho fromWho;

  MessageDto({required this.text, this.imgUrl, required this.fromWho});
}
