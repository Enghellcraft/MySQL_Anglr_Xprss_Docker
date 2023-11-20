import { Component, OnInit, Input, OnChanges, SimpleChanges } from '@angular/core';
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
    console.log(this.currentSortedColumn)
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

/* orderBy(param: string){
  eval(`this.productos = this.productos.sort((a, b) => {
      // Use square bracket notation to access the property dynamically
      const aValue = a.${param};
      const bValue = b.${param};
  
      if (typeof aValue === 'number' && typeof bValue === 'number' && this.flagOrder == 0) {
        // Compare numbers
        return aValue - bValue;
      } else if (typeof aValue === 'string' && typeof bValue === 'string' && this.flagOrder == 0) {
        // Compare strings
        return aValue.localeCompare(bValue);
      } else if (typeof aValue === 'number' && typeof bValue === 'number' && this.flagOrder == 1) {
        // Compare numbers
        return bValue - aValue;
      } else if (typeof aValue === 'string' && typeof bValue === 'string' && this.flagOrder == 1) {
        // Compare strings
        return bValue.localeCompare(aValue);
      } else {
        // Fallback: maintain the current order
        return 0;
      }
    });`)
    
    this.flagOrder++
    if(this.flagOrder == 2){
      this.flagOrder = 0
    }
  } */

// orderBy(param: string) {
//   console.log(this.productos)
//   // Assuming param is the property name by which you want to sort
//   eval(`this.productos = this.productos.sort((a, b) => a.${param} - b.${param})`)
    
//   }

ngOnChanges(changes: SimpleChanges) {
    if (changes['productos']) {
      this.productos = this.productos.map(producto => ({ ...producto, showDetails: false }));
    }
  }

}
