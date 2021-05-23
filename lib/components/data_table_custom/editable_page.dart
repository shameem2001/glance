import 'package:glance/components/data_table_custom/dummy_users.dart';
import 'package:glance/models/table_appliances.dart';
import 'package:glance/components/data_table_custom/utils.dart';
import 'package:glance/components/data_table_custom/scrollable_widget.dart';
import 'package:glance/components/data_table_custom/text_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  List<Appliances> users;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ScrollableWidget(child: buildDataTable()),
  );

  Widget buildDataTable() {
    final columns = ['Appliances', 'Power', 'Count', 'Time'];

    return DataTable(
      columnSpacing: 45,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = false;//column == columns[3];

      return DataColumn(
        label: Text(column, style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Appliances> users) => users.map((Appliances user) {
    final cells = [user.appliance, user.power, user.count, user.time];

    return DataRow(
      cells: Utils.modelBuilder(cells, (index, cell) {
        //final showEditIcon = index == 0 || index == 1 || index == 2 || index == 3;;

        return DataCell(
          Text('$cell', style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),),
          //showEditIcon: showEditIcon,
          onTap: () {
            switch (index) {
              case 0:
                editAppliance(user);
                break;
              case 1:
                editPower(user);
                break;
              case 2:
                editCount(user);
                break;
              case 3:
                editTime(user);
                break;
            }
          },
        );
      }),
    );
  }).toList();

  Future editAppliance(Appliances editUser) async {
    final appliance = await showTextDialog(
      context,
      title: 'Change Appliance Name',
      value: editUser.appliance,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(appliance: appliance) : user;
    }).toList());
  }

  Future editPower(Appliances editUser) async {
    final power = await showTextDialog(
      context,
      title: 'Change Power Output',
      value: editUser.power,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(power: power) : user;
    }).toList());
  }

  Future editCount(Appliances editUser) async {
    final count = await showTextDialog(
      context,
      title: 'Change Count',
      value: editUser.count,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(count: count) : user;
    }).toList());
  }

  Future editTime(Appliances editUser) async {
    final time = await showTextDialog(
      context,
      title: 'Change Time used',
      value: editUser.time,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(time: time) : user;
    }).toList());
  }
}
