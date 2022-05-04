import 'dart:convert';

import 'package:flutter/foundation.dart';

class SeatLayoutModel {
  final int rows;
  final int cols;
  final List<Map<String, dynamic>> seatTypes;
  final int theatreId;
  final int gap;
  final int gapColIndex;
  final bool isLastFilled;
  final List<int> rowBreaks;
  SeatLayoutModel({
    required this.rows,
    required this.cols,
    required this.seatTypes,
    required this.theatreId,
    required this.gap,
    required this.gapColIndex,
    required this.isLastFilled,
    required this.rowBreaks,
  });

  SeatLayoutModel copyWith({
    int? rows,
    int? cols,
    List<Map<String, dynamic>>? seatTypes,
    int? theatreId,
    int? gap,
    int? gapColIndex,
    bool? isLastFilled,
    List<int>? rowBreaks,
  }) {
    return SeatLayoutModel(
      rows: rows ?? this.rows,
      cols: cols ?? this.cols,
      seatTypes: seatTypes ?? this.seatTypes,
      theatreId: theatreId ?? this.theatreId,
      gap: gap ?? this.gap,
      gapColIndex: gapColIndex ?? this.gapColIndex,
      isLastFilled: isLastFilled ?? this.isLastFilled,
      rowBreaks: rowBreaks ?? this.rowBreaks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rows': rows,
      'cols': cols,
      'seatTypes': seatTypes,
      'theatreId': theatreId,
      'gap': gap,
      'gapColIndex': gapColIndex,
      'isLastFilled': isLastFilled,
      'rowBreaks': rowBreaks,
    };
  }

  factory SeatLayoutModel.fromMap(Map<String, dynamic> map) {
    return SeatLayoutModel(
      rows: map['rows']?.toInt() ?? 0,
      cols: map['cols']?.toInt() ?? 0,
      seatTypes: List<Map<String, dynamic>>.from(map['seatTypes']?.map((x) => x)),
      theatreId: map['theatreId']?.toInt() ?? 0,
      gap: map['gap']?.toInt() ?? 0,
      gapColIndex: map['gapColIndex']?.toInt() ?? 0,
      isLastFilled: map['isLastFilled'] ?? false,
      rowBreaks: List<int>.from(map['rowBreaks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SeatLayoutModel.fromJson(String source) => SeatLayoutModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SeatLayoutModel(rows: $rows, cols: $cols, seatTypes: $seatTypes, theatreId: $theatreId, gap: $gap, gapColIndex: $gapColIndex, isLastFilled: $isLastFilled, rowBreaks: $rowBreaks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SeatLayoutModel &&
        other.rows == rows &&
        other.cols == cols &&
        listEquals(other.seatTypes, seatTypes) &&
        other.theatreId == theatreId &&
        other.gap == gap &&
        other.gapColIndex == gapColIndex &&
        other.isLastFilled == isLastFilled &&
        listEquals(other.rowBreaks, rowBreaks);
  }

  @override
  int get hashCode {
    return rows.hashCode ^
        cols.hashCode ^
        seatTypes.hashCode ^
        theatreId.hashCode ^
        gap.hashCode ^
        gapColIndex.hashCode ^
        isLastFilled.hashCode ^
        rowBreaks.hashCode;
  }
}
