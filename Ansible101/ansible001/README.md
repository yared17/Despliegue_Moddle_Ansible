# Cofiguración de Ansible

## Primer paso, instalación de los servidores web y de archivos.
# Desde la carpeta de ansible001 donde estan ubicados los arichivos .yml con las configuraciones de los roles
# Ejecuta el playbook de esta manera desde ansible001

ansible-playbook -i ../host all.yml

# -i es porque le paso el inventario de hosts que tenemos dentro de la carpeta ansible101
