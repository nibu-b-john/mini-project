import 'package:flutter/material.dart';
import 'package:nemesis_hackathon/models.dart/activity.dart';

var AcitivityList = [
  Acitivity(
      time: '8:00am',
      icon: Icons.done,
      date: '14/10/22',
      type: 'Recyclable',
      accepted: true),
  Acitivity(
      time: '04:00pm',
      icon: Icons.done,
      date: '04/10/22',
      type: 'Non Recyclable',
      accepted: true),
  Acitivity(
      time: '03:00pm',
      icon: Icons.close,
      date: '24/09/22',
      type: 'Non Recyclable',
      accepted: false),
  Acitivity(
      time: '02:00pm',
      icon: Icons.close,
      date: '06/09/22',
      type: 'Recyclable',
      accepted: false),
];
