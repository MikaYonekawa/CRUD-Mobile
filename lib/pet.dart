class Pet {
  String _nome = '';
  int _idade = 0;
  String _raca = '';

  Pet(this._nome, this._idade, this._raca);
  get nome => this._nome;

  set nome(value) => this._nome = value;

  get idade => this._idade;

  set idade(value) => this._idade = value;

  get raca => this._raca;

  set raca(value) => this._raca = value;
}
