import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Producto, Repositor, Sector } from 'models';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  private apiUrl = 'http://localhost:3000/api';

  constructor(private http: HttpClient) {}

  //getProductos puede recibir 2 parametros no obligatorios
  //si existen se suma a los params al hacer el request
  //si no existen se envia el request con params vacios osea devolviendo todos los productos
  getProductos(repositor?: Repositor, sector?: Sector): Observable<Producto[]> {
    let params = new HttpParams();

    if (repositor) {
      params = params.set('repositorId', repositor.id_repositor.toString());
    }

    if (sector) {
      params = params.set('sectorId', sector.id_sector.toString());
    }
    
    return this.http.get<Producto[]>(`${this.apiUrl}/productos`, { params });
  }

   getRepositores() {
     return this.http.get<Repositor[]>(`${this.apiUrl}/repositores`)
   }

   getSectores() {
     return this.http.get<Sector[]>(`${this.apiUrl}/sectores`)
   }

}
