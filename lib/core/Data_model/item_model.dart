class ItemModel {
  String? imageUrl; // URL of the image
  bool isPlaceholder; // Flag to indicate if this is a placeholder

  ItemModel({this.imageUrl, this.isPlaceholder = true});

  void updateWithImage(String url) {
    imageUrl = url;
    isPlaceholder = false;
  }
}

ItemModel item1 = ItemModel(
    imageUrl:
        'https://ih1.redbubble.net/image.4727395.7933/ssrco,slim_fit_t_shirt,two_model,fafafa:ca443f4786,front,tall_portrait,750x1000.webp');
