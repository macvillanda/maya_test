import 'package:maya_test/constants/constants.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';

class UserAccount {
  double _currentBalance = initialAmount;
  List<String> _ids = [];
  List<DataEntity> data;
  UserAccount({
    required this.data,
  });

  void setDataItems(List<DataEntity> newData) {
    data = newData;
    final sentAmounts = data.fold(0.0, (acc, element) {
      return acc + element.amount;
    });
    _currentBalance = initialAmount - sentAmounts;
    _ids = data.map((e) => e.id).toList();
  }

  void addItem(DataEntity newData) {
    List<DataEntity> newItems = data;
    newItems.add(newData);
    setDataItems(newItems);
  }

  List<String> get ids => _ids;

  double getCurrentBalance() {
    return _currentBalance;
  }
}
