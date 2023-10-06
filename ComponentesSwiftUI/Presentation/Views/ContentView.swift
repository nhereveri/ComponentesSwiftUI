import SwiftUI

protocol VistaPersonalizada {
  var vista: AnyView { get }
}

struct Elemento {
  var titulo: String
  var descripcion: String
  var vistaPersonalizada: VistaPersonalizada
  var icono: String
}

struct ElementoRow: View {
  var elemento: Elemento

  var body: some View {
    NavigationLink(destination: DetalleView(elemento: elemento)) {
      HStack(alignment: .top) { // Alinea el contenido superiormente
        Image(systemName: elemento.icono)
          .font(.title)
          .foregroundColor(.blue)
        VStack(alignment: .leading, spacing: 4) { // Alinea el contenido a la izquierda
          Text(elemento.titulo)
            .font(.headline)
          Text(elemento.descripcion)
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        Spacer() // Espacio entre el contenido
      }
    }
  }
}

struct ContentView: View {
  let elementos: [Elemento] = [
    Elemento(
      titulo: "Elemento 1",
      descripcion: "Descripción del Elemento 1",
      vistaPersonalizada: MiVistaPersonalizada1(),
      icono: "circle.fill"
    ),
    Elemento(
      titulo: "Elemento 2",
      descripcion: "Descripción del Elemento 2",
      vistaPersonalizada: MiVistaPersonalizada2(),
      icono: "square.fill"
    )
  ]

  var body: some View {
    NavigationView {
      List(elementos, id: \.titulo) { elemento in
        ElementoRow(elemento: elemento)
      }
      .navigationBarTitle("Lista de Elementos")
    }
  }
}

struct DetalleView: View {
  var elemento: Elemento

  var body: some View {
    elemento.vistaPersonalizada.vista
      .navigationBarTitle(elemento.titulo)
  }
}

struct MiVistaPersonalizada1: VistaPersonalizada {
  var vista: AnyView {
    return AnyView(
      Text("Contenido personalizado para el Elemento 1")
    )
  }
}

struct MiVistaPersonalizada2: VistaPersonalizada {
  var vista: AnyView {
    return AnyView(
      Text("Contenido personalizado para el Elemento 2")
    )
  }
}

#Preview {
  ContentView()
}
