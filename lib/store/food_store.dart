import 'package:grocery/model/food_restaurant.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'food_store.g.dart';

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, FoodRestaurant> filterFoodRestaurantMap =
      ObservableMap<String, FoodRestaurant>();

  @observable
  ObservableMap<String, FoodRestaurant> foodRestaurantMap =
      ObservableMap<String, FoodRestaurant>();

  @action
  getFoodRestaurantMap() async {
    if (foodRestaurantMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, FoodRestaurant> response = await foodService.getFoodData();
        print("reponse in food store");
        print(response);
        foodRestaurantMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in food store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterFoodRestaurantMap = ObservableMap<String, FoodRestaurant>();
    List<FoodRestaurant> dataList = List();
    foodRestaurantMap.forEach((key, value) {
      dataList.add(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filterFoodRestaurantMap.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterFoodRestaurantMap = ObservableMap<String, FoodRestaurant>();
  }

  @action
  clearStore() {
    isLoading = false;
    foodRestaurantMap = ObservableMap<String, FoodRestaurant>();
    isSearching = false;
    filterFoodRestaurantMap = ObservableMap<String, FoodRestaurant>();
  }
}
