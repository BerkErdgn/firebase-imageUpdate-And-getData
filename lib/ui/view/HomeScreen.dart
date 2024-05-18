import 'package:animalapp/data/entity/Animals.dart';
import 'package:animalapp/ui/cubit/HomeScreenCubit.dart';
import 'package:animalapp/ui/view/AnimalDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeScreenCubit>().getAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animals Home"),),
      body: BlocBuilder<HomeScreenCubit,List<Animals>>(
        builder: (context,animalsList){
          if(animalsList.isNotEmpty){
            return GridView.builder(
              itemCount: animalsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/2
              ),
              itemBuilder: (context,index){
                var animal = animalsList[index];
                print(animal);
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalDetailScreen(animal: animal)));
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(animal.animalImageUrl),
                        Text(animal.animalName),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
