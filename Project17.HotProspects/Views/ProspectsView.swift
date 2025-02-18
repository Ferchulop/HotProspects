//
//  ProspectsView.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 11/2/25.
//
import CodeScanner
import SwiftUI
import SwiftData
import UserNotifications
struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    let filter: FilterType
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    @State private var isContacted = false
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspects) { prospect in
                // CHALLENGE 1 : Add an icon to the “Everyone” screen showing whether a prospect was contacted or not.
                HStack {
                    if prospect.isContacted {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .foregroundStyle(.green)
                    } else {
                        Image(systemName: "questionmark.diamond")
                            .font(.title)
                            .foregroundStyle(.red)
                    }
                    VStack(alignment: .leading) {
                        
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundStyle(.secondary)
                    }
                }
                // Permite que al deslizar uno de los prospects aparezcan botones con opciones, eliminar, marcar como contactado/no contactado y agregar recordatorio
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    if prospect.isContacted {
                        Button("Mark Uncontacted", systemImage:"person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted", systemImage:"person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                            
                        }
                        .tint(.green)
                        Button("Remind Me", systemImage: "bell") {
                            addNotifications(for: prospect)
                        }
                        .tint(.orange)
                    }
                }
                // Necesario para poder manejar la selección múltiple y saber que elementos están seleccionados en $selectedProspects
                .tag(prospect)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                if selectedProspects.isEmpty == false {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete Selected", action: delete)
                        
                    }
                }
            }
            // El CodeScannerView estará listo para escanear códigos QR. Si se escanea un código QR, se activará el closure handleScan(result:), que manejará el resultado del escaneo, ya sea success o failure.
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "PaulHudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
        
    }
    init(filter: FilterType) {
        self.filter = filter
        if filter != .none {
            let showContactedOnly = filter == .contacted
            // #Predicate es un filtro de consulta para SwiftData
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
            
        }
    }
    // Función para convertir un código QR en un contacto
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            // verifica mail y nombre para generar
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            let person = Prospect(name: details[0], emailAddress: details [1], isContacted: false)
            modelContext.insert(person)
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
            
        }
        
    }
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    // Función para programar notificaciones con recordatorio
    func addNotifications(for prospect: Prospect) {
        // Gestor de notificaciones de iOS
        let center = UNUserNotificationCenter.current()
        // Crea el contenido de la notifiación
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
            
        }
        // Pide permiso al usuario si es necesario
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            
            
            
        }
        
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
