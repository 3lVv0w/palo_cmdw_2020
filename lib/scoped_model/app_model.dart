import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  double _seeds = 100.0;

  bool _isDark = false;

  int get sunFlowerSeeds => _seeds.floor();

  double get seeds => _seeds;

  bool get isDark => _isDark;

  void toggleTheme(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  void updateSeed(double seeds) {
    _seeds = seeds;
    notifyListeners();
  }
}
