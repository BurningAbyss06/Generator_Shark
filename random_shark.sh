#!/bin/bash

directorio_tiburones=$(pwd)


if [ ! -d "$directorio_tiburones" ]; then
  echo "Error: El directorio '$directorio_tiburones' no existe."
  exit 1
fi

archivos_tiburones=$(ls "$directorio_tiburones" | grep "\.txt$")
num_tiburones=$(echo "$archivos_tiburones" | wc -l)

if [ "$num_tiburones" -eq 0 ]; then
  echo "Error: No se encontraron archivos de tiburones (.txt) en '$directorio_tiburones'."
  exit 1
fi

indice_aleatorio=$(( (RANDOM % num_tiburones) + 1 ))
nombre_archivo_aleatorio=$(echo "$archivos_tiburones" | sed -n "${indice_aleatorio}p")
ruta_archivo_aleatorio="$directorio_tiburones/$nombre_archivo_aleatorio"
cat "$ruta_archivo_aleatorio"
