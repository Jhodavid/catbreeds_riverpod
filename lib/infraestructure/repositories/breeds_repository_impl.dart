import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

import 'package:catbreeds_riverpod/domain/repositories/abstract_breeds_repository.dart';

import 'package:catbreeds_riverpod/infraestructure/datasources/breed_cat_api_datasource.dart';



class BreedsRepositoryImpl extends AbstractBreedsRepository {

  final BreedCatApiDataSource breedsDatasource;

  BreedsRepositoryImpl(this.breedsDatasource);

  @override
  Future<List<BreedEntity>?> getBreeds() async {
    return breedsDatasource.getCatBreeds();
  }

  @override
  Future<List<String>?> getBreedImages(String breedId) {
    return breedsDatasource.getCatBreedImagesURLs(breedId);
  }

}