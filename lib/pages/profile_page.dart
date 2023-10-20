import 'package:flutter/material.dart';

int itemCountProfile = 5;
List<String> data = ["Navn", "Alder","Køn","CPR-nummer","Læge"];


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCountProfile,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("${(data[index])}:"),
          leading: const Icon(Icons.perm_contact_cal_rounded),
          // trailing: const Icon(Icons.check_box_outline_blank_rounded),
          onTap: (){
            debugPrint("${(data[index])}:");
          },
        );
      },
    );
  }
}
