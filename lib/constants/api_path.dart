import "dart:io";

abstract class Environment {
  String _urlAPI = "";
  String _service = "";
  String _user = "";
  String _password = "";

  String getUrlApi() => _urlAPI;
  String getService() => _service;
  String getUser() => _user;
  String getPassword() => _password;
}

class DEBUG extends Environment {
  DEBUG() {
    _urlAPI = "https://localhost:3336/";
    _service = "api/QontaApi/";
    _user = "dev_user";
    _password = "dev_password";
  }
}

class DEV extends Environment {
  DEV() {
    _urlAPI = "https://dev.api.qonta.com/";
    _service = "api/QontaApi/";
    _user = "dev_user";
    _password = "dev_password";
  }
}

class EnvironmentFactory {
  static Environment getEnvironment(String environment) {
    switch(environment){
      case "DEBUG":
        return DEBUG();
      case "DEV":
        return DEV();
      default:
        return DEBUG();
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = 
      (X509Certificate cert, String host, int port) => true;
  }
}