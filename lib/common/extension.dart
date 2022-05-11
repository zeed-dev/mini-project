// Padding
import 'package:flutter/material.dart';

EdgeInsetsGeometry paddingAll(double val) => EdgeInsets.all(val);
EdgeInsetsGeometry paddingLeft(double val) => EdgeInsets.only(left: val);
EdgeInsetsGeometry paddingRight(double val) => EdgeInsets.only(right: val);
EdgeInsetsGeometry paddingTop(double val) => EdgeInsets.only(top: val);
EdgeInsetsGeometry paddingBottom(double val) => EdgeInsets.only(bottom: val);
EdgeInsetsGeometry paddingOnly(
        {double left = 0.0, top = 0.0, right = 0.0, bottom = 0.0}) =>
    EdgeInsets.only(top: top, right: right, bottom: bottom, left: left);
