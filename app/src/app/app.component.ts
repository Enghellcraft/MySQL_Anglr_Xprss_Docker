import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto, Sector, Repositor } from 'models';

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
   this.getAllProductos().subscribe((data: Producto[]) => {
     this.productos = data;
   });
   this.getSectoresNombre().subscribe((data: Sector[]) => {
     this.sectores = data;
   });
   this.getRepositoresNombre().subscribe((data: Repositor[]) => {
     this.repositores = data;
   });
 }

 getAllProductos() {
  return this.http.get<Producto[]>('http://localhost:3000/api/productos');
 }

 getRepositoresNombre() {
   return this.http.get<Repositor[]>('http://localhost:3000/api/repositores');
 }

 getSectoresNombre() {
   return this.http.get<Sector[]>('http://localhost:3000/api/sectores');
 }

 mostrarResultados = false

 buscar() {
   this.mostrarResultados = true
 }

 cancelar() {
   this.mostrarResultados = false
 }
}