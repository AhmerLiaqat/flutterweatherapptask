class WeatherModel {
  dynamic? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  dynamic? tzoffset;
  String? description;
  List<Days>? days;
 
  Stations? stations;
  CurrentConditions? currentConditions;

  WeatherModel(
      {this.queryCost,
      this.latitude,
      this.longitude,
      this.resolvedAddress,
      this.address,
      this.timezone,
      this.tzoffset,
      this.description,
      this.days,
      
      this.stations,
      this.currentConditions});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    description = json['description'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
   
    stations = json['stations'] != null
        ? new Stations.fromJson(json['stations'])
        : null;
    currentConditions = json['currentConditions'] != null
        ? new CurrentConditions.fromJson(json['currentConditions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['queryCost'] = this.queryCost;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['resolvedAddress'] = this.resolvedAddress;
    data['address'] = this.address;
    data['timezone'] = this.timezone;
    data['tzoffset'] = this.tzoffset;
    data['description'] = this.description;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    
    if (this.stations != null) {
      data['stations'] = this.stations!.toJson();
    }
    if (this.currentConditions != null) {
      data['currentConditions'] = this.currentConditions!.toJson();
    }
    return data;
  }
}

class Days {
  String? datetime;
  dynamic? datetimeEpoch;
  double? tempmax;
  double? tempmin;
  double? temp;
  double? feelslikemax;
  double? feelslikemin;
  double? feelslike;
  double? dew;
  double? humidity;
  double? precip;
  double? precipprob;
  double? precipcover;
  List<String>? preciptype;
  dynamic? snow;
  dynamic? snowdepth;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? cloudcover;
  double? visibility;
  double? solarradiation;
  double? solarenergy;
  dynamic? uvindex;
  dynamic? severerisk;
  String? sunrise;
  dynamic? sunriseEpoch;
  String? sunset;
  dynamic? sunsetEpoch;
  double? moonphase;
  String? conditions;
  String? description;
  String? icon;
  String? source;
  List<Hours>? hours;

  Days(
      {this.datetime,
      this.datetimeEpoch,
      this.tempmax,
      this.tempmin,
      this.temp,
      this.feelslikemax,
      this.feelslikemin,
      this.feelslike,
      this.dew,
      this.humidity,
      this.precip,
      this.precipprob,
      this.precipcover,
      this.preciptype,
      this.snow,
      this.snowdepth,
      this.windgust,
      this.windspeed,
      this.winddir,
      this.pressure,
      this.cloudcover,
      this.visibility,
      this.solarradiation,
      this.solarenergy,
      this.uvindex,
      this.severerisk,
      this.sunrise,
      this.sunriseEpoch,
      this.sunset,
      this.sunsetEpoch,
      this.moonphase,
      this.conditions,
      this.description,
      this.icon,
      
      this.source,
      this.hours});

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    
    source = json['source'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(new Hours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['datetimeEpoch'] = this.datetimeEpoch;
    data['tempmax'] = this.tempmax;
    data['tempmin'] = this.tempmin;
    data['temp'] = this.temp;
    data['feelslikemax'] = this.feelslikemax;
    data['feelslikemin'] = this.feelslikemin;
    data['feelslike'] = this.feelslike;
    data['dew'] = this.dew;
    data['humidity'] = this.humidity;
    data['precip'] = this.precip;
    data['precipprob'] = this.precipprob;
    data['precipcover'] = this.precipcover;
    data['preciptype'] = this.preciptype;
    data['snow'] = this.snow;
    data['snowdepth'] = this.snowdepth;
    data['windgust'] = this.windgust;
    data['windspeed'] = this.windspeed;
    data['winddir'] = this.winddir;
    data['pressure'] = this.pressure;
    data['cloudcover'] = this.cloudcover;
    data['visibility'] = this.visibility;
    data['solarradiation'] = this.solarradiation;
    data['solarenergy'] = this.solarenergy;
    data['uvindex'] = this.uvindex;
    data['severerisk'] = this.severerisk;
    data['sunrise'] = this.sunrise;
    data['sunriseEpoch'] = this.sunriseEpoch;
    data['sunset'] = this.sunset;
    data['sunsetEpoch'] = this.sunsetEpoch;
    data['moonphase'] = this.moonphase;
    data['conditions'] = this.conditions;
    data['description'] = this.description;
    data['icon'] = this.icon;
    
    data['source'] = this.source;
    if (this.hours != null) {
      data['hours'] = this.hours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hours {
  String? datetime;
  dynamic? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  dynamic? snow;
  dynamic? snowdepth;
  List<String>? preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  dynamic? uvindex;
  dynamic? severerisk;
  String? conditions;
  String? icon;

  String? source;

  Hours(
      {this.datetime,
      this.datetimeEpoch,
      this.temp,
      this.feelslike,
      this.humidity,
      this.dew,
      this.precip,
      this.precipprob,
      this.snow,
      this.snowdepth,
      this.preciptype,
      this.windgust,
      this.windspeed,
      this.winddir,
      this.pressure,
      this.visibility,
      this.cloudcover,
      this.solarradiation,
      this.solarenergy,
      this.uvindex,
      this.severerisk,
      this.conditions,
      this.icon,
     
      this.source});

  Hours.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
   
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['datetimeEpoch'] = this.datetimeEpoch;
    data['temp'] = this.temp;
    data['feelslike'] = this.feelslike;
    data['humidity'] = this.humidity;
    data['dew'] = this.dew;
    data['precip'] = this.precip;
    data['precipprob'] = this.precipprob;
    data['snow'] = this.snow;
    data['snowdepth'] = this.snowdepth;
    data['preciptype'] = this.preciptype;
    data['windgust'] = this.windgust;
    data['windspeed'] = this.windspeed;
    data['winddir'] = this.winddir;
    data['pressure'] = this.pressure;
    data['visibility'] = this.visibility;
    data['cloudcover'] = this.cloudcover;
    data['solarradiation'] = this.solarradiation;
    data['solarenergy'] = this.solarenergy;
    data['uvindex'] = this.uvindex;
    data['severerisk'] = this.severerisk;
    data['conditions'] = this.conditions;
    data['icon'] = this.icon;
    
    data['source'] = this.source;
    return data;
  }
}

class Stations {
  F4270? f4270;

  Stations({this.f4270});

  Stations.fromJson(Map<String, dynamic> json) {
    f4270 = json['F4270'] != null ? new F4270.fromJson(json['F4270']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.f4270 != null) {
      data['F4270'] = this.f4270!.toJson();
    }
    return data;
  }
}

class F4270 {
  dynamic? distance;
  double? latitude;
  double? longitude;
  dynamic? useCount;
  String? id;
  String? name;
dynamic? quality;
  dynamic? contribution;

  F4270(
      {this.distance,
      this.latitude,
      this.longitude,
      this.useCount,
      this.id,
      this.name,
      this.quality,
      this.contribution});

  F4270.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = this.distance;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['useCount'] = this.useCount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['quality'] = this.quality;
    data['contribution'] = this.contribution;
    return data;
  }
}

class CurrentConditions {
  String? datetime;
  dynamic? datetimeEpoch;
  dynamic? temp;
  dynamic? feelslike;
  double? humidity;
  double? dew;
  dynamic? precip;
  dynamic? precipprob;
  dynamic? snow;
  dynamic? snowdepth;
 
  double? windgust;
  double? windspeed;
  dynamic? winddir;
  dynamic? pressure;
  
  double? cloudcover;
  dynamic? solarradiation;
  dynamic? solarenergy;
  dynamic? uvindex;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;
  String? sunrise;
  dynamic? sunriseEpoch;
  String? sunset;
  dynamic? sunsetEpoch;
  double? moonphase;

  CurrentConditions(
      {this.datetime,
      this.datetimeEpoch,
      this.temp,
      this.feelslike,
      this.humidity,
      this.dew,
      this.precip,
      this.precipprob,
      this.snow,
      this.snowdepth,
      
      this.windgust,
      this.windspeed,
      this.winddir,
      this.pressure,
      
      this.cloudcover,
      this.solarradiation,
      this.solarenergy,
      this.uvindex,
      this.conditions,
      this.icon,
      this.stations,
      this.source,
      this.sunrise,
      this.sunriseEpoch,
      this.sunset,
      this.sunsetEpoch,
      this.moonphase});

  CurrentConditions.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'].cast<String>();
    source = json['source'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['datetimeEpoch'] = this.datetimeEpoch;
    data['temp'] = this.temp;
    data['feelslike'] = this.feelslike;
    data['humidity'] = this.humidity;
    data['dew'] = this.dew;
    data['precip'] = this.precip;
    data['precipprob'] = this.precipprob;
    data['snow'] = this.snow;
    data['snowdepth'] = this.snowdepth;
   
    data['windgust'] = this.windgust;
    data['windspeed'] = this.windspeed;
    data['winddir'] = this.winddir;
    data['pressure'] = this.pressure;
    
    data['cloudcover'] = this.cloudcover;
    data['solarradiation'] = this.solarradiation;
    data['solarenergy'] = this.solarenergy;
    data['uvindex'] = this.uvindex;
    data['conditions'] = this.conditions;
    data['icon'] = this.icon;
    data['stations'] = this.stations;
    data['source'] = this.source;
    data['sunrise'] = this.sunrise;
    data['sunriseEpoch'] = this.sunriseEpoch;
    data['sunset'] = this.sunset;
    data['sunsetEpoch'] = this.sunsetEpoch;
    data['moonphase'] = this.moonphase;
    return data;
  }
}
