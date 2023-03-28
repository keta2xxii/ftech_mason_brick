import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_schedule.dart';

abstract class BaseState<T extends StatefulWidget,
    SCHEDULE extends BaseSchedule> extends State<T> {
  @protected
  late SCHEDULE viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<SCHEDULE>(context, listen: false);
    viewModel.context = context;
  }
}
