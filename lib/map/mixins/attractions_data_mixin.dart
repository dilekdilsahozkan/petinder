import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petinder/map/models/attraction.model.dart';

class AttractionDataMixin {
  List<Attraction> attractionList = [
    Attraction(
      attractionName: 'Gölbaşı Hayvan Barınağı',
      address:
          'Gölbaşı Hayvan Barınağı',
      description: 'Shelter 1',
      thumbnail:
          'https://globalassets.starbucks.com/assets/d2fbf41711cc4343b84980e4e18328ff.jpg',
      locationCoords: LatLng(
        39.8038, 32.8134
      ),
    ),
    Attraction(
      attractionName: 'Çankaya Belediyesi Sahipsiz Hayvan Rehabilitasyon Merkezi',
      address:
          'Çankaya Belediyesi Sahipsiz Hayvan Rehabilitasyon Merkezi',
      description: 'Shelter 2',
      thumbnail:
          'https://www.mallofegypt.com/-/media/moeg/shopping/tradeline/tradeline---store-image-min.jpg',
      locationCoords: LatLng(
        39.844451, 32.873866
      ),
    ),
    Attraction(
      attractionName: 'Çankaya Belediyesi Hayvan Barınağı',
      address:
          'Çankaya Belediyesi Hayvan Barınağı',
      description: 'Shelter 3',
      thumbnail:
          'http://targetfortab.com/ar/cache/widgetkit/gallery/54/640-6c6d9e4da0-4fdb73743a.jpg',
      locationCoords: LatLng(
        39.885218, 32.678116
      ),
    ),
    
   
  ];
}