import { Component, OnInit, Input, OnChanges, SimpleChanges, AfterViewInit } from '@angular/core';
import { Producto } from 'models';

@Component({
  selector: 'app-search-results-table',
  templateUrl: './search-results-table.component.html',
  styleUrls: ['./search-results-table.component.css']
})
export class SearchResultsTableComponent implements OnInit, OnChanges {


  @Input() productos!: Producto[]

  flagOrder = 0
  currentSortedColumn!: string
  constructor() { }

  ngOnInit() { }
  
  orderBy(property: string) {
    // console.log(this.currentSortedColumn)
    if (this.currentSortedColumn == property){
      this.productos = this.productos.reverse()
    }
    else {
      eval(`this.productos = this.productos.sort((a, b) => {
          if (a.${property} < b.${property}) {
            return -1;
          } else if (a.${property} > b.${property}) {
            return 1;
          } else {
            return 0;
          }
        })`)
        this.currentSortedColumn = property
    }
  }


  ngOnChanges(changes: SimpleChanges) {
      if (changes['productos']) {
        this.productos = this.productos.map(producto => ({ ...producto, showDetails: false }));
      }
    }
  }
