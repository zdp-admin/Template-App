import 'package:template/models/promotion.dart';
import 'package:rxdart/rxdart.dart';

class PromoZoneBloc {
  final _typeController = BehaviorSubject<int>();
  final _stateController = BehaviorSubject<int>();
  final _loadingController = BehaviorSubject<bool>();
  final _listPromotionsController = BehaviorSubject<List<Promotion>>();

  Stream<int> get typeStream => _typeController.stream;
  Stream<int> get stateStream => _stateController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<List<Promotion>> get listPromotionsStream =>
      _listPromotionsController.stream;

  Function(int) get changeType => _typeController.sink.add;
  Function(int) get changeState => _stateController.sink.add;
  Function(bool) get changeLoading => _loadingController.sink.add;
  Function(List<Promotion>) get changeListPromotions =>
      _listPromotionsController.sink.add;

  int get type => _typeController.value;
  int get state => _stateController.value;
  bool get loading => _loadingController.value;
  List<Promotion> get listPromotions => _listPromotionsController.value;

  PromoZoneBloc() {
    _typeController.sink.add(1);
    _stateController.sink.add(1);
    _loadingController.sink.add(false);
  }

  dispose() {
    _typeController?.close();
    _stateController?.close();
    _loadingController?.close();
    _listPromotionsController?.close();
  }
}
