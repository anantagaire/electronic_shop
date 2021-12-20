import 'package:electronic_shop/core/models/category_models.dart';

class CategoryServices{
  List<CategoryModels> category = [];
  List<CategoryModels> addList(){
    category.add(CategoryModels(name: "laptop"));
    category.add(CategoryModels(name: "mobile"));
    category.add(CategoryModels(name: "keyboard"));
    category.add(CategoryModels(name: "headseat"));
    category.add(CategoryModels(name: "watch"));
    return category;
  }

}