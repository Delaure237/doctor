import 'package:appointment_repository/appointment_repository.dart';
import 'package:flutter/material.dart';


  Color getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.canceled:
        return Colors.red;
      case AppointmentStatus.confirmed:
        return Colors.green;
      default:
        return Colors.grey; // Couleur par défaut si le statut est inconnu
    }
  }


String getStatusText( AppointmentStatus status) {

    switch (status) {

      case AppointmentStatus.pending:
        return "Pending";
      case AppointmentStatus.canceled:
        return "Canceled";
      case AppointmentStatus.completed:
        return "Confirmed";
      default: 
        return "confirmed";
    }
  }


