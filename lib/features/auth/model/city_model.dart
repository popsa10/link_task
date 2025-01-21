import 'package:easy_localization/easy_localization.dart';
import 'package:link_task/generated/locale_keys.g.dart';

class CityModel {
  int? cityId;
  String? cityName;

  CityModel(
      {this.cityId,
        this.cityName,
      });
}


List<CityModel> cities = [CityModel(
  cityId: 1,
  cityName: LocaleKeys.riyadh.tr()
)];
