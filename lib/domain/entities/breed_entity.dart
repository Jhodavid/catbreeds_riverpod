
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

  BreedEntity copyWith({
    String? id,
    String? name,
    String? weight,
    String? origin,
    String? lifeSpan,
    String? description,
    List<String>? imagesUrls,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    int? hypoallergenic,
    Uri? cfaUrl,
    Uri? vetstreetUrl,
    Uri? vcahospitalsUrl,
    Uri? wikipediaUrl
  }) => BreedEntity(
    id: id ?? this.id, 
    name: name ?? this.name, 
    weight: weight ?? this.weight, 
    origin: origin ?? this.origin, 
    lifeSpan: lifeSpan ?? this.lifeSpan, 
    description: description ?? this.description,
    imagesUrls: imagesUrls ?? this.imagesUrls,
    adaptability: adaptability ?? this.adaptability,
    affectionLevel: affectionLevel ?? this.affectionLevel,
    childFriendly: childFriendly ?? this.childFriendly,
    dogFriendly: dogFriendly ?? this.dogFriendly,
    energyLevel: energyLevel ?? this.energyLevel, 
    grooming: grooming ?? this.grooming, 
    healthIssues: healthIssues ?? this.healthIssues, 
    intelligence: intelligence ?? this.intelligence, 
    sheddingLevel: sheddingLevel ?? this.sheddingLevel, 
    socialNeeds: socialNeeds ?? this.socialNeeds, 
    strangerFriendly: strangerFriendly ?? this.strangerFriendly, 
    vocalisation: vocalisation ?? this.vocalisation, 
    experimental: experimental ?? this.experimental, 
    hairless: hairless ?? this.hairless, 
    natural: natural ?? this.natural, 
    rare: rare ?? this.rare, 
    rex: rex ?? this.rex, 
    suppressedTail: suppressedTail ?? this.suppressedTail, 
    shortLegs: shortLegs ?? this.shortLegs, 
    hypoallergenic: hypoallergenic ?? this.hypoallergenic,
    cfaUrl: cfaUrl ?? this.cfaUrl,
    vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
    vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
    wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl
  );

}

