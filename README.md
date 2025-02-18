# HotProspects
HotProspects es una app desarrollada en SwiftUI para gestionar contactos. Permite escanear códigos QR para agregar posibles clientes o clientes potenciales a una lista. Después, pueden marcar sus estados como: "Contactados" ó "No contactados" con la posibilidad de programar recordatorios para hacer un seguimiento.

# Características

Escaneo de códigos QR: Agrega contactos escaneando su código QR. Uso de: **Core Image**
Generación de QR personal: Comparte tu info mediante un código QR generado automaticamente. Uso del gestor de dependencias: **CodeScanner** 
Gestor de Contactos: Filtra contactos en "Todos", "Contactados" y "No Contactados". Uso de: **SwiftData**
Gestos de deslizamiento: Marca los contactos como contactados o no contactados, agrégales recordatorios o elíminalos. Uso de: **UserNotifications**
