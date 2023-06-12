
class BreedEntity {

  final String id;
  final String name;
  final String weight;
  final String origin;
  final String lifeSpan;
  final String description;
  final List<String> imagesUrls;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final int hypoallergenic;
  final Uri? cfaUrl;
  final Uri? vetstreetUrl;
  final Uri? vcahospitalsUrl;
  final Uri? wikipediaUrl;

  BreedEntity({
    required this.id, 
    required this.name, 
    required this.weight, 
    required this.origin, 
    required this.lifeSpan, 
    required this.description, 
    this.imagesUrls = const [], 
    required this.adaptability, 
    required this.affectionLevel, 
    required this.childFriendly, 
    required this.dogFriendly, 
    required this.energyLevel, 
    required this.grooming, 
    required this.healthIssues, 
    required this.intelligence, 
    required this.sheddingLevel, 
    required this.socialNeeds, 
    required this.strangerFriendly, 
    required this.vocalisation, 
    required this.experimental, 
    required this.hairless, 
    required this.natural, 
    required this.rare, 
    required this.rex, 
    required this.suppressedTail, 
    required this.shortLegs, 
    required this.hypoallergenic, 
    this.cfaUrl, 
    this.vetstreetUrl, 
    this.vcahospitalsUrl, 
    this.wikipediaUrl
  });
}