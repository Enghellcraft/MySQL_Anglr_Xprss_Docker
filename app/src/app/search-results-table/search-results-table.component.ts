import { Component, OnInit, Input, OnChanges, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-search-results-table',
  templateUrl: './search-results-table.component.html',
  styleUrls: ['./search-results-table.component.css']
})
export class SearchResultsTableComponent implements OnInit, OnChanges {
  //En este input property se trae la lista de productos desde el app.component principal
  @Input() productos!: any[]

  constructor() { }

  ngOnInit() {
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['productos']) {
      this.productos = this.productos.map(producto => ({ ...producto, showDetails: false }));
    }
  }

}
