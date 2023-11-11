import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto, Sector, Repositor } from './models';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'app';
  productos: Producto[] = [];
  sectores: Sector[] = [];
  repositores: Repositor[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get<Producto[]>('http://localhost:3000/api/productos').subscribe((data: Producto[]) => {
      this.productos = data;
    });
    this.http.get<Sector[]>('http://localhost:3000/api/sectores').subscribe((data: Sector[]) => {
      this.sectores = data;
    });
    this.http.get<Repositor[]>('http://localhost:3000/api/repositores').subscribe((data: Repositor[]) => {
      this.repositores = data;
    });
  }

  mostrarResultados = false

  buscar() {
    this.mostrarResultados = true
  }

  cancelar() {
    this.mostrarResultados = false
  }
}