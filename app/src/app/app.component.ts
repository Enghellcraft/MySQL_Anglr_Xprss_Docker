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
   this.loadInitialData();
 }


 mostrarResultados = false

 buscar() {
    this.applyFilter()
    this.mostrarResultados = true
 }

 cancelar() {
   this.mostrarResultados = false
 }


 loadInitialData() {
  this.dataService.getSectores().subscribe((data) => {
    this.sectores = data;
  });

  this.dataService.getRepositores().subscribe((data) => {
    this.repositores = data;
  });
  }

  applyFilter() {
   // variables para enviar al service
    let repositorToUpdate
    let sectorToUpdate

    //si hay checkbox los guarda, sino undefined
    if(this.isCheckedRepositor)
      repositorToUpdate = this.selectedRepositor

    if(this.isCheckedSector)
      sectorToUpdate = this.selectedSector

    this.dataService
      .getProductos(repositorToUpdate, sectorToUpdate)
      .subscribe((data) => {
        this.productos = data;
      });
  }

  setTodosSector(){
    if(this.isCheckedSector){
      this.selectedSector = undefined!
    }
  }

  setTodosRepositor(){
    if(this.isCheckedRepositor){
      this.selectedRepositor = undefined!
    }

  }

}