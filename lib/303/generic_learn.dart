

class UserManagament<T extends AdminUser>{
  final T admin;

  UserManagament(this.admin);
  void sayName(GenericUser user){
    print(user.name);
  }

  int calculateMoney(List<GenericUser> userList){
    int sum =0;
    for (var user in userList) {
      sum += user.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = userList.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
    final _money = userList.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);

    return _money;
  }
  
  Iterable<VBModel<R>>? showNames<R>(List<GenericUser> userList){
  // bunu sadece role  olanlar görebilir

  if(R == String){
    final names= userList.map((e) => VBModel<R>(e.name.split('').toList().cast<R>()));
    return names;
  }
  return null;
    
  }
}

class VBModel<T>{
  final String name = 'vb';
  final List<T> items;

  VBModel(this.items);
}

class GenericUser{
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);

  bool findUserName(String name){
    return this.name == name;
  }
}

class AdminUser extends GenericUser{
  final int role;
  AdminUser(String name, String id, int money, this.role) : super(name, id, money);

}