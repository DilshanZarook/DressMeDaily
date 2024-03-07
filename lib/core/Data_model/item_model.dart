class ItemModel {
  String? imageUrl; // URL of the image
  bool isPlaceholder; // Flag to indicate if this is a placeholder

  ItemModel({this.imageUrl, this.isPlaceholder = true});

  void updateWithImage(String url) {
    imageUrl = url;
    isPlaceholder = false;
  }
}
