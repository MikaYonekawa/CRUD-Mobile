

import 'package:exercicio_crud/pet.dart';

class PetRepo {
  static List<Pet> _listPet = [];
  static get get_listPet => _listPet;

  set listPet(value) => _listPet = value;

  static add(Pet pet) {
    _listPet.add(pet);
  }

  static void remover(Pet pet) {
    _listPet.remove(pet);
  }

  static imprimir() {
    print(get_listPet.toString());
  }
}
