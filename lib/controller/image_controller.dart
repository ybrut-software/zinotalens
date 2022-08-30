import '../services/api_client.dart';

String fetchImageController({required String photoUrl}) {
  String url = "$baseUrl/api/images/$photoUrl";
  return url;
}
