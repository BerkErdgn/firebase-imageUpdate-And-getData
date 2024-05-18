import 'package:animalapp/data/entity/Animals.dart';
import 'package:flutter/material.dart';

class AnimalDetailScreen extends StatefulWidget {
  Animals animal;
  AnimalDetailScreen({required this.animal});

  @override
  State<AnimalDetailScreen> createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animals Detail"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(widget.animal.animalImageUrl),
              Text(widget.animal.animalName),
              Text(widget.animal.animalDetail),
            ],
        ),

      ),
    );
  }
}
