import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getHotels(String state) async {
  // HIDE THE KEY BEFORE MAKING TS PUBLIC
  const apiKey = "AIzaSyD7rseKaAYDSM7gm_a0Yk6Nz-JttfZRlRw";

  final url = Uri.parse(
    "https://maps.googleapis.com/maps/api/place/textsearch/json"
    "?query=hotels+in+$state"
    "&key=$apiKey",
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print("jsonDecode(response.body)['results']");
    print(jsonDecode(response.body)['results']);
    return jsonDecode(response.body)['results'];
  }

  return [];
}
