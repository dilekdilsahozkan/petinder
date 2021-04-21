import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petinder/a_map/models/attraction_model.dart';

class AttractionDataMixin {
  List<Attraction> attractionList = [
    Attraction(
      attractionName: 'Gölbaşı Hayvan Barınağı',
      address:
          'Gölbaşı Hayvan Barınağı',
      description: 'Shelter 1',
      thumbnail:
          'https://emoji.com.tr/wp-content/uploads/2019/10/kopek-seven-kadin.jpg',
      locationCoords: LatLng(
        39.8098, 32.8078
      ),
    ),
    Attraction(
      attractionName: 'Çankaya Belediyesi Sahipsiz Hayvan Rehabilitasyon Merkezi',
      address:
          'Çankaya Belediyesi Sahipsiz Hayvan Rehabilitasyon Merkezi',
      description: 'Shelter 2',
      thumbnail:
          'https://emoji.com.tr/wp-content/uploads/2019/10/kopegin-patilerini-tutan-insan.jpg',
      locationCoords: LatLng(
        39.8467, 32.8729
      ),
    ),
    Attraction(
      attractionName: 'Çankaya Belediyesi Hayvan Barınağı',
      address:
          'Çankaya Belediyesi Hayvan Barınağı',
      description: 'Shelter 3',
      thumbnail:
          'http://images.bursadabugun.com/haber/2019/07/29/1159258-veterinerlerden-toki-ye-cagri-81-ilde-barinak-yapin-5d3e90bdb9a38.jpg',
      locationCoords: LatLng(
        39.8845, 32.6729
      ),
    ),
    Attraction(
      attractionName: 'Patiliköy Köpek Barınağı',
      address:
          'Patiliköy Köpek Barınağı',
      description: 'Shelter 4',
      thumbnail:
          'https://www.miyhav.com/icerik/uploads/2018/11/hayvan-barinagi-1024x649.webp',
      locationCoords: LatLng(
        39.9101, 32.8044
      ),
    ),
    Attraction(
      attractionName: 'Yenimahalle Belediyesi Hayvan Barınağı',
      address:
          'Yenimahalle Belediyesi Hayvan Barınağı',
      description: 'Shelter 5',
      thumbnail:
          'https://emoji.com.tr/wp-content/uploads/2019/10/kafeste-kediler.jpg',
      locationCoords: LatLng(
        39.9648, 32.7883
      ),
    ),
   
  ];
}