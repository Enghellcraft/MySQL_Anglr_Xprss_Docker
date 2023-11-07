import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-search-results-table',
  templateUrl: './search-results-table.component.html',
  styleUrls: ['./search-results-table.component.css']
})
export class SearchResultsTableComponent implements OnInit {
  //En este input property se trae la lista de productos desde el app.component principal
  @Input() productos!: any[]

  constructor() { }

  ngOnInit() {
  }

}
