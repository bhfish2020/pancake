/**
 *
 * {
    "id": 1,
    "name": 1,
    "stack_temp": 1,
    "env_temp": 1,
    "service_availablity_percentage": 1,
    "downtime": 1,
    "created_at": "2023-11-28T20:59:43.000000Z",
    "updated_at": "2023-11-28T20:59:43.000000Z",
    "deleted_at": null
    }
 */

class PlantModel{
  final int id;
  final String name;
  final double stack_temp;
  final double env_temp;
  final double service_availablity_percentage;
  final double downtime;
  final String created_at;
  final String updated_at;
  final String? deleted_at;

  PlantModel({
    required this.id,
    required this.name,
    required this.stack_temp,
    required this.env_temp,
    required this.service_availablity_percentage,
    required this.downtime,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      stack_temp: json['stack_temp'],
      env_temp: json['env_temp'],
      service_availablity_percentage: json['service_availablity_percentage'],
      downtime: json['downtime'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      deleted_at: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "stack_temp": stack_temp,
    "env_temp": env_temp,
    "service_availablity_percentage": service_availablity_percentage,
    "downtime": downtime,
    "created_at": created_at,
    "updated_at": updated_at,
    "deleted_at": deleted_at,
  };

  @override
  String toString() {
    return 'PlantModel{id: $id, name: $name, stack_temp: $stack_temp, env_temp: $env_temp, service_availablity_percentage: $service_availablity_percentage, downtime: $downtime, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at}';
  }
}