import '../enum/filter_search_type.dart';
import 'filter_search_data.dart';

class FilterSearchControl {
  FilterSearchType controlType;
  List<FilterSearchData> dataSet;

  FilterSearchControl(this.controlType, this.dataSet);
}
