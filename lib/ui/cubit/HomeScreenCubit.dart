

import 'package:animalapp/data/entity/Animals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<List<Animals>>{
  HomeScreenCubit():super(<Animals>[]);
  
  var collectionAnimals = FirebaseFirestore.instance.collection("animalsData");

  Future<void> getAnimals()async{
      collectionAnimals.snapshots().listen((event) {
        var animalsList = <Animals>[];

        var documents = event.docs;
        for(var document in documents){
          var data = document.data();
          var animal = Animals.fromJson(data);
          animalsList.add(animal);
        }

        emit(animalsList);
      });
  }

  Future<void> searchAnimal(String searchedAnimal)async{
    collectionAnimals.snapshots().listen((event) {
      var animalsList = <Animals>[];

      var documents = event.docs;
      for(var document in documents){
        var data = document.data();
        var animal = Animals.fromJson(data);

        if(animal.animalName.toLowerCase().contains(searchedAnimal.toLowerCase())){
          animalsList.add(animal);
        }

      }

      emit(animalsList);
    });
  }
  
}