class OccasionLoginModel
{
  late final String message;
  late final String token;

  OccasionLoginModel.fromJason(Map<String,dynamic> jason,)
  {
    message = jason['message'];
    token = jason['token'] ?? 'Null';
  }
}