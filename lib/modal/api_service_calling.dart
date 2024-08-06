import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class ApiServiceCalling
{
  String api  = "https://sheetdb.io/api/v1/ouwcx61mcku8f";
  
  Future<String?> apicalling()
  async {
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);
    if(response.statusCode == 200)
      {
        print("---------api successfully called-----------");
        return response.body;
      }
    return null;
  }
}