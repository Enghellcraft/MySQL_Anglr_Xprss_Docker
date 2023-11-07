import { Component } from '@angular/core';
import { flush } from '@angular/core/testing';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'app';
  productos: any[] = productosMock // asignar a esta propiedad la lista de productos para visualizar en la tabla

  mostrarResultados = false

  buscar() {
    // Armar logica para que busque los productos
    // Por el momento lo dejo solo para que modifique la prop mostrar resultados y que aparezca la tabla
    this.mostrarResultados = true
  }

  cancelar() {
    this.mostrarResultados = false
  }
}

const productosMock = [
  { id: 1, nombre: 'Leche', gondola: 'Lacteos', descripcion: 'Leche' },
  { id: 2, nombre: 'Pan', gondola: 'Panadería', descripcion: 'Pan blanco 500gms' },
]