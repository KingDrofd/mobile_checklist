import 'package:flutter/material.dart';

class CardData {
  final String id;
  final String info;
  final String title;
  final int checkListIndex;
  final double progress;
  final String cardColor;

  CardData({
    required this.cardColor,
    required this.info,
    required this.title,
    required this.progress,
    required this.checkListIndex,
    this.id = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'info': info,
        'progress': progress,
        'checklistlength': checkListIndex,
        'card color': cardColor,
      };

  static CardData fromJson(Map<String, dynamic> json) => CardData(
        cardColor: json['card color'],
        info: json['info'],
        title: json['title'],
        progress: json['progress'],
        checkListIndex: json['checklistlength'],
      );
}

final cardtitle = TextEditingController();
final cardtext = TextEditingController();
final cardProgress = TextEditingController();
final cardIndexCheckList = 0;
