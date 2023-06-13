import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

import 'package:catbreeds_riverpod/infraestructure/models/cat_api/breed_images_response.dart';
import 'package:catbreeds_riverpod/infraestructure/models/cat_api/breeds_response.dart';



class BreedsCatApiMapper {

  static BreedEntity breedToEntity( 
    BreedResponse breed 
  ) => BreedEntity(
    id: breed.id, 
    name: breed.name, 
    weight: breed.weight.metric, 
    origin: breed.origin, 
    lifeSpan: breed.lifeSpan,
    imagesUrls: const [],
    description: breed.description, 
    adaptability: breed.adaptability, 
    affectionLevel: breed.affectionLevel, 
    childFriendly: breed.childFriendly, 
    dogFriendly: breed.dogFriendly, 
    energyLevel: breed.energyLevel, 
    grooming: breed.grooming, 
    healthIssues: breed.healthIssues, 
    intelligence: breed.intelligence, 
    sheddingLevel: breed.sheddingLevel, 
    socialNeeds: breed.socialNeeds, 
    strangerFriendly: breed.strangerFriendly, 
    vocalisation: breed.vocalisation, 
    experimental: breed.experimental, 
    hairless: breed.hairless, 
    natural: breed.natural, 
    rare: breed.rare, 
    rex: breed.rex, 
    suppressedTail: breed.suppressedTail, 
    shortLegs: breed.shortLegs, 
    hypoallergenic: breed.hypoallergenic,
    cfaUrl: breed.cfaUrl != null ? Uri.parse(breed.cfaUrl!) : null,
    vetstreetUrl: breed.vetstreetUrl != null ? Uri.parse(breed.vetstreetUrl!) : null,
    vcahospitalsUrl: breed.vcahospitalsUrl != null ? Uri.parse(breed.vcahospitalsUrl!) : null,
    wikipediaUrl: breed.wikipediaUrl != null ? Uri.parse(breed.wikipediaUrl!) : null,
  );

  static String breedImageToString( 
    BreedImagesResponse breedImages
  ) => breedImages.url;

}