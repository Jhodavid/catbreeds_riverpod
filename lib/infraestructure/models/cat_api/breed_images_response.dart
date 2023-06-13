
class BreedImagesResponse {
    final String id;
    final String url;
    final int width;
    final int height;

    BreedImagesResponse({
        required this.id,
        required this.url,
        required this.width,
        required this.height,
    });

    factory BreedImagesResponse.fromJson(Map<String, dynamic> json) => BreedImagesResponse(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
}