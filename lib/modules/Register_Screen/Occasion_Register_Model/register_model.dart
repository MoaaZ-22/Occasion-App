class OccasionRegisterModel
{
  late final String message;
  late final String token;

  OccasionRegisterModel.fromJason(Map<String,dynamic> jason,)
  {
    message = jason['message'];
    token = jason['token'] ?? 'Null';
  }
}