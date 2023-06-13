
import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

abstract class AbstractBreedsDatasource {

  Future<List<BreedEntity>?> getCatBreeds();

  Future<List<String>?> getCatBreedImagesURLs(String breedId);

}