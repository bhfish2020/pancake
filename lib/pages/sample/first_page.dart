import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pancakes/models/plant_model.dart';

import '../../provider/get_server_data_provider.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlantModel? plant = ref.watch(plantHolderProvider);
    TextEditingController _controller = TextEditingController();
    var plantObject;

    return Center(
      child: Column(
        children: [
          Text('The name is: ${plant?.name??'null'}'),
          Text('The id is: ${plant?.id??'null'}'),
          Text('The Stack Temp is: ${plant?.stack_temp??'null'}'),
          Text('The Env Temp is: ${plant?.env_temp??'null'}'),
          Text('The Service Availability Percentage is: ${plant?.service_availablity_percentage??'null'}'),
          Text('The Downtime is: ${plant?.downtime??'null'}'),
          Container(
            height: 300,
            width: 500,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    //number keyboard
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Number",
                    ),
                    //number regex, only allow number
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () async {
                  plantObject = await ref.read(getCurrentStateProvider(int.parse(_controller.text)));
                  ref.watch(plantHolderProvider.notifier).setPlantHolder(plantObject);
                }, child: Text("Get Data From Server")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
