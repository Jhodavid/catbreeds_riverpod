import 'package:flutter/foundation.dart';

import 'package:catbreeds_riverpod/infraestructure/mappers/breeds_cat_api_mapper.dart';
import 'package:catbreeds_riverpod/infraestructure/models/cat_api/breed_images_response.dart';

import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';
import 'package:catbreeds_riverpod/domain/datasources/breeds_datasource.dart';

import 'package:catbreeds_riverpod/infraestructure/services/cat_api_dio_service.dart';
import 'package:catbreeds_riverpod/infraestructure/models/cat_api/breeds_response.dart';



class BreedCatApiDataSource extends AbstractBreedsDatasource {

  @override
  Future<List<BreedEntity>?> getCatBreeds() async {
    try {

      final response = await CatApiDioService.catApiDio.get(
        '/breeds'
      );

      final breedsResponse = List<BreedResponse>.from(
        response.data.map(
          (json) => BreedResponse.fromJson(json)
        )
      );

      final breedList = List<BreedEntity>.from(
        breedsResponse.map(
          (breed) => BreedsCatApiMapper.breedToEntity(breed)
        )
      );

      return breedList;

    } catch (e) {
      if(kDebugMode) print(e);
      return null;
    }
  }
  
  @override
  Future<List<String>?> getCatBreedImagesURLs(String breedId) async {
    try {
      
      final response = await CatApiDioService.catApiDio.get(
        '/images/search?limit=3&breed_ids=$breedId'
      );

      final breedImagesResponse = List<BreedImagesResponse>.from(
        response.data.map(
          (json) => BreedImagesResponse.fromJson(json)
        )
      );

      final breedImages = List<String>.from(
        breedImagesResponse.map(
          (image) => BreedsCatApiMapper.breedImageToString(image)
        )
      );

      return breedImages;

    } catch (e) {
      if(kDebugMode) print(e);
      return null;
    }
  }


}