cd /tmp/
mkdir -p ~/.themes/
mkdir -p ~/.icons/
git clone https://github.com/dracula/gtk.git ~/.themes/dracula/
git clone https://github.com/EliverLara/Ant-Dracula --branch slim  ~/.themes/Ant-Dracula/
git clone https://github.com/archbyte/Adwaita-Slim --branch dark ~/.themes/Adwaita-Slim-Dark/gtk-3.0/

sudo apt install gnome-tweaks dconf -y

wget https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTExNDk3ODQiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6Ijg3NjlkMmE3MjQ0ZDI3ZTMyYjdmZTYzMTkzMmY0ZDc3YmM4ZDY4ZTJmOWMyYWZiZWM5YjVkODIyOTUwMzAwOTg3Y2FlOWQ5Y2QxMjJhZmE4NDg3OGE4ZDc1M2Q5ODc4NDEwNmY4NmIxYjBmZWQ4ZGJkYmU0MjY4YTNlMGM3NjAxIiwidCI6MTYxMzI0ODUxNywic3RmcCI6bnVsbCwic3RpcCI6bnVsbH0.OdNSrpjWu6tYNJOtanuNEM-kW4ByMlL61nus1WKYdbk/Tela-black.tar.xz
tar -xf Tela-black.tar.xz -C ~/.icons/

wget https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1ODA0MDIzODkiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjEzMGIyM2VmZDFlNDZkZDAxNThmNmZiYTI1ZGUyMmVmNmMyYTQ2ZDFhMzQ1NDg2MWEyY2Y0MDAxYzY2Yjc5ZDEyYWQ2Yjg5OTlhM2RlNDRlMjA1ZDQ3ZGMzN2IyZTk4NDAxZjdiZGJlNzQ1OWVhMGUwMWExZDc3NGE2YWNjMzk4IiwidCI6MTYxMzI1MDE0Nywic3RmcCI6IjA0MTBiM2M3M2ZiYzYxMzc4YTI4MjZjZDZmZjY5MGQyIiwic3RpcCI6IjI4MDQ6MTRkOjVjZDE6NGJjZTpjMmE1OjZjZWI6MzMzZjplZTljIn0.0VRqo9ZFcLh0LE7u-6Bjylfrhah5et4_FMEdHBHs2DQ/McMojave-cursors.tar.xz

tar -xf McMojave-cursors.tar.xz -C ~/.icons
mv McMojave-cursors ~/.icons/McMojave

# Configura GNOME
# https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
# dconf dump '/' > custom-dconf.toml
dconf load '/' < custom-dconf.toml


# Dash to Dock, User Themes, Caffeine, Soft brightness, WindowOverlay Icons

