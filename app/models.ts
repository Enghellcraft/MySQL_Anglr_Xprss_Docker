export interface Empresa {
  id_empresa: number;
  razon_social: string;
  domicilio: string;
}

export interface Repositor {
  id_repositor: number;
  nombre: string;
  id_empresa: number;
}

export interface Sector {
  id_sector: number;
  desc_sector: string;
}

export interface Gondola {
  id_gondola: number;
  nombre: string;
  id_sector: number;
}

export interface Fila_Producto {
  id_fila: number;
  nombre: string;
}

export interface Producto {
  id_producto: number;
  nombre: string;
  descripcion: string;
  id_producto_reemplazo: number;
  Fila_Producto_id_fila: number;
  fecha: string;
  cantidad: number;
}

export interface Presentacion {
  id_presentacion: number;
  desc_presentacion: string;
}

export interface Gondola_Producto {
  id_producto: number;
  id_gondola: number;
  Presentacion_id_presentacion: number;
}

export interface Gondola_Producto_Repositor {
  id_producto: number;
  id_gondola: number;
  id_repositor: number;
  fecha: string;
  cantidad: number;
}