import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto, Sector, Repositor } from 'models';
import { DataService } from 'src/service';

@Component({
 selector: 'app-root',
 templateUrl: './app.component.html',
 styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
 title = 'app';
 productos: Producto[] = [];
 sectores: Sector[] = [];
 selectedSector!: Sector;
 repositores: Repositor[] = [];
 selectedRepositor!: Repositor;
  
 isCheckedSector = false;
 isCheckedRepositor = false;

 constructor(
  private http: HttpClient,
  private dataService: DataService) {}

 ngOnInit() {
  //  this.getAllProductos().subscribe((data: Producto[]) => {
  //    this.productos = data;
  //  });
  //  this.getSectoresNombre().subscribe((data: Sector[]) => {
  //    this.sectores = data;
  //  });
  //  this.getRepositoresNombre().subscribe((data: Repositor[]) => {
  //    this.repositores = data;
  //  });
   this.loadInitialData();
 }

//  getAllProductos() {
//   return this.http.get<Producto[]>('http://localhost:3000/api/productos');
//  }

//  getRepositoresNombre() {
//    return this.http.get<Repositor[]>('http://localhost:3000/api/repositores');
//  }

//  getSectoresNombre() {
//    return this.http.get<Sector[]>('http://localhost:3000/api/sectores');
//  }

 mostrarResultados = false

 buscar() {
    this.applyFilter()
    this.mostrarResultados = true
 }

 cancelar() {
   this.mostrarResultados = false
 }


 loadInitialData() {
  this.dataService.getProductos().subscribe((data) => {
    this.productos = data;
  });

  this.dataService.getSectores().subscribe((data) => {
    this.sectores = data;
  });

  this.dataService.getRepositores().subscribe((data) => {
    this.repositores = data;
  });
  }

  /* applyFilter() {
    this.dataService
      .getProductos(this.selectedRepositor.id_repositor, this.selectedSector.id_sector)
      .subscribe((data) => {
        this.productos = data;
      });
  } */
  test(valor: any){
    this.selectedSector == valor
    console.log(this.selectedRepositor.id_repositor)
    console.log(this.selectedSector.id_sector)
  }

  test2(){
    console.log(this.selectedRepositor.id_repositor)
    console.log(this.selectedSector.id_sector)
  }

  setRepositor(value: Repositor){
    console.log(value.id_repositor)
    this.selectedRepositor = value
  }
  
  applyFilter(){
    if(this.isCheckedRepositor && this.isCheckedSector){
      this.dataService.getProductosBySectorAndRepositor(this.selectedRepositor.id_repositor, this.selectedSector.id_sector).subscribe((data) => {
        this.productos = data;
      });
    } else if(this.isCheckedRepositor){
      this.dataService.getProductByRepositorId(this.selectedRepositor.id_repositor).subscribe((data) => {
        this.productos = data;
      });
    } else if(this.isCheckedSector){
      this.dataService.getProductBySector(this.selectedSector.id_sector).subscribe((data) => {
        this.productos = data;
      });
    } else {
      this.dataService.getAllProductos().subscribe((data) => {
        this.productos = data;
      });
    }
  }

}

