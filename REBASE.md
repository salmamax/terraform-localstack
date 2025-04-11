# Proceso de Rebase para Limpieza de Commits

## Objetivo

Reorganizar el historial de Git para:
- Unificar commits relacionados.
- Mejorar claridad en mensajes.

## Pasos Realizados

1.  **Crear commits de prueba**:
    - Se añadieron cambios menores para simular un historial desorganizado.
2.  **Rebase interactivo**:
    - Se usó `git rebase -i HEAD~3` para:
    - **Renombrar** commits (`reword`).
    - **Fusionar** commits relacionados (`squash`).
3.  **Push forzado**:
    - Se aplicó `git push --force` para actualizar el repositorio remoto.

## Lecciones Aprendidas

- El rebase es útil para mantener un historial limpio *antes* de hacer push público.
- El uso de `--force` debe ser controlado en entornos colaborativos.
