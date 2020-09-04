  class HoroscopeModel{
  final String horoscope;
  final String sunsign;

  HoroscopeModel({this.horoscope,this.sunsign});
  factory HoroscopeModel.fromJson(final json){
    return HoroscopeModel(
      horoscope: json["horoscope"],
      sunsign: json["sunsign"]
    );
  }
}