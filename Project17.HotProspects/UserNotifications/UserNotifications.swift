//
//  UserNotifications.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 11/2/25.
//
import UserNotifications
import SwiftUI

struct UserNotifications: View {
    var body: some View {
        VStack {
            // Requiere permiso al usuario para enviar notificaciones
            Button("Requires Permission") {
                // 1º Solicita permisos al usuario, 2º muestra alertas, cambia el icono del badge y emite un sonido
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                        
                    }
                    
                }
                
                
            }
            // Cre y programa una notificacion para mostrarla después de un intervalo de 5 seg
            Button("Schedule Notifications") {
                // Esta clase contiene los detalles de la notificacion, titulo, subtitulo y tipo de sonido
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It's time to give your furry friend some love."
                content.sound = UNNotificationSound.default
                // La notificacion se enviará despues de 5 seg y no se volverá a repetir
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                // Solicitud que contiene la notificacion, un identificador único para gestionar la notificacion y sus eventos futuros
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                // Finalmente se agrega al centro de notificaciones utilizando. add(request) y será gestionada por el sistema en el tiempo establecido ( 5seg)
                UNUserNotificationCenter.current().add(request)
            }
            
            
        }
        
    }
}

#Preview {
    UserNotifications()
}
