class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() => _singleton;

  Singleton._internal();

  static late double Currentlat;
  static late double CurrentLong;
  static String? addressLine;
}

main() {}
