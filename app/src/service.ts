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

  getProductos(repositorId?: number, sectorId?: number): Observable<Producto[]> {
    let params = new HttpParams();
    
    if (repositorId) {
      params = params.set('repositorId', repositorId.toString());
    }

    if (sectorId) {
      params = params.set('sectorId', sectorId.toString());
    }

    return this.http.get<Producto[]>(`${this.apiUrl}/productos`, { params });   
  }

  getAllProductos() {
    return this.http.get<Producto[]>(`${this.apiUrl}/productos`)
   }

  getProductByRepositorId(repositorId: number){
    return this.http.get<Producto[]>(`${this.apiUrl}/productos/repositor/${repositorId}`)
  }
  
  getProductBySector(sectorId: number){
    return this.http.get<Producto[]>(`${this.apiUrl}/productos/sector/${sectorId}`)
  }

  getProductosBySectorAndRepositor(repositorId: number, sectorId: number){
    return this.http.get<Producto[]>(`${this.apiUrl}/productos/repositor-sector/${repositorId}/${sectorId}`)
  }
  
   getRepositores() {
     return this.http.get<Repositor[]>(`${this.apiUrl}/repositores`)
   }
  
   getSectores() {
     return this.http.get<Sector[]>(`${this.apiUrl}/sectores`)
   }

}
