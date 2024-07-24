import SwiftUI

struct IDnowView: UIViewControllerRepresentable {
    typealias UIViewControllerType = IDnowController
    
    
    func makeUIViewController(context: Context) -> IDnowController {
        IDnowController()
    }
    
    func updateUIViewController(_ uiViewController: IDnowController, context: Context) {
        // Update the ViewController here
    }
}

struct ContentView: View {
    
    var network = NetworkMonitor()
    
    var body: some View {
        VStack {
            Text("IDnow AutoIdent SDK Test").font(.title.bold()).padding(.top, 40)
            Text(network.isConnected ? "✅ Internet available" : "❌ Internet not available").padding(10)
            IDnowView()
        }
    }
}

#Preview {
    ContentView()
}
