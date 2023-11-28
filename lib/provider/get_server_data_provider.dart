import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pancakes/models/plant_model.dart';
import 'package:pancakes/repository/repository.dart';

import '../utils/app_constants.dart';

//make a get request to APP_CONSTANTS.GET_CURRENT_STATE


final getCurrentStateProvider = Provider.autoDispose.family<dynamic, int>((ref, plant_id) async {
  Map<String,dynamic> queryParameters = {
    "plant_id": plant_id,
  };
  var response = await ref.watch(repository).get(AppConstants.GET_CURRENT_STATE, queryParameters);
  final plant = PlantModel.fromJson(response);
  print(plant.name);
  return plant;

});


final getAllPlantsProvider = Provider.autoDispose<dynamic>((ref) async {

  var response = await ref.watch(repository).get(AppConstants.GET_PLANT_LIST, {});
  return response;

});


//StateProvider that holds int value of plant_id

final plantIdProvider = StateNotifierProvider<plantStateNotifier, int>((ref) => plantStateNotifier());

class plantStateNotifier extends StateNotifier<int>{
  plantStateNotifier() : super(0);

  void setPlantId(int id){
    state = id;
  }

}


//State notifier provider that holds plant model
final plantHolderProvider = StateNotifierProvider<plantHolderStateNotifier, PlantModel?>((ref) => plantHolderStateNotifier());

class plantHolderStateNotifier extends StateNotifier<PlantModel?>{
  plantHolderStateNotifier() : super(null);

  void setPlantHolder(PlantModel plant){
    state = plant;
  }

}
