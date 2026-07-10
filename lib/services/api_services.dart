import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://corsproxy.io/?https://fakenews.squirro.com/news/sport';

  static Future<List<dynamic>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // Menyesuaikan dengan struktur JSON dari API squirro (biasanya ada key 'news' atau sejenisnya)
        if (data.containsKey('news')) {
          return data['news'];
        } else {
          return [data];
        }
      } else {
        throw Exception('Gagal memuat berita');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
