import 'package:flutter/material.dart';
import 'package:hrm_aqtech/utils/constants/enums.dart';

class HeplerFunction {
  static Color getRoleColor(EmployeeRole role) {
    switch (role) {
      case EmployeeRole.Developer:
        return Colors.teal;
      case EmployeeRole.Support:
        return const Color.fromRGBO(254, 112, 102, 1);
      case EmployeeRole.Sale:
        return Colors.orange;
      case EmployeeRole.HR:
        return Colors.deepPurpleAccent;
      default:
        return Colors.blue;
    }
  }

  static String convertRole(String value) {
    switch (value) {
      case "1":
        {
          return EmployeeRole.Developer.name.toString();
        }
      case "2":
        {
          return EmployeeRole.Sale.name.toString();
        }
      default:
        return EmployeeRole.Support.name.toString();
    }
  }

  static EmployeeRole getRoleFromString(String role) {
    switch (role) {
      case 'Developer':
        return EmployeeRole.Developer;
      case 'Sale':
        return EmployeeRole.Sale;
      case 'BM':
        return EmployeeRole.BM;
      case 'HR':
        return EmployeeRole.HR;
      case 'Support':
        return EmployeeRole.Support;
      default:
        return EmployeeRole.Developer; // Default fallback
    }
  }

  static String convertEnumToInt(EmployeeRole role) {
    switch (role) {
      case EmployeeRole.Developer:
        return "1";
      case EmployeeRole.Sale:
        return "2";
      default:
        return "3";
    }
  }

  static EmployeeRole convertToEnum(String value) {
    switch (value) {
      case "1":
        {
          return EmployeeRole.Developer;
        }
      case "2":
        {
          return EmployeeRole.Sale;
        }
      default:
        return EmployeeRole.Support;
    }
  }

  static String removeDiacritics(String str) {
    const withDiacritics =
        'àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ';
    const withoutDiacritics =
        'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydAAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIoooooooooooooooouuuuuuuuuuuyyyyYD';

    for (int i = 0; i < withDiacritics.length; i++) {
      str = str.replaceAll(withDiacritics[i], withoutDiacritics[i]);
    }
    return str;
  }

  static Color getStatusColor(ApprovalStatus status) {
    switch (status) {
      case ApprovalStatus.approved:
        return const Color.fromARGB(255, 62, 144, 65);
      case ApprovalStatus.rejected:
        return Colors.red;
      default:
        return const Color.fromARGB(255, 198, 129, 51);
    }
  }

  static Icon getStatusIcon(ApprovalStatus status) {
    switch (status) {
      case ApprovalStatus.approved:
        return const Icon(
          Icons.check,
          color: Colors.white,
        );
      case ApprovalStatus.rejected:
        return const Icon(
          Icons.clear_rounded,
          color: Colors.white,
        );
      default:
        return const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        );
    }
  }

  static ApprovalStatus convertStatusToEnum(String status) {
    switch (status) {
      case "Đã duyệt":
        return ApprovalStatus.approved;
      case "Chưa duyệt":
        return ApprovalStatus.pending;
      case "Từ chối":
        return ApprovalStatus.rejected;
      default:
        return ApprovalStatus.pending;
    }
  }

  static String convertEnumToString(ApprovalStatus status) {
    switch (status) {
      case ApprovalStatus.approved:
        return "Đã duyệt";
      case ApprovalStatus.pending:
        return "Chưa duyệt";
      case ApprovalStatus.rejected:
        return "Từ chối";
      default:
        return "Chưa duyệt"; // Default value
    }
  }

  static String displayStatusFromEnum(ApprovalStatus status) {
    switch (status) {
      case ApprovalStatus.approved:
        return "Duyệt";
      case ApprovalStatus.pending:
        return "Chưa duyệt";
      case ApprovalStatus.rejected:
        return "Từ chối";
      default:
        return "Chưa duyệt";
    }
  }
}
