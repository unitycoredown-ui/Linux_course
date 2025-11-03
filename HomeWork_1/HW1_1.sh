#!/bin/bash

## Создание дома

mkdir -p house/{1_floor/{guest_room,kitchen},2_floor/{bedroom/nightstand,library},basement}
chmod 700 house/basement

cat > house/1_floor/kitchen/fridge.txt << EOF
Nothing edible right now, except for a couple of tomatoes and a cucumber. It would be nice to cook something on the stove.
EOF

touch house/1_floor/kitchen/{table.png,chair.png,sink.png,trashbin.txt,closets.txt,window.png,stove.sh}

cat > house/1_floor/kitchen/trashbin.txt << EOF
Trash, nothing useful here
EOF
chmod +x house/1_floor/kitchen/stove.sh
cat > house/1_floor/kitchen/stove.sh << EOF
#!/bin/bash
fridge="fridge.txt"
cat > "$fridge" << EOF
A nice meal appeared here, looks delicious.
EOF

cat > house/1_floor/kitchen/closets.txt << EOF
Just a spherical horse in a vacuum floating here, nothing strange.
EOF

touch house/1_floor/guest_room/{couch.png,tv.png,chair_1.png,chair_2.png,radio_broadcast.txt}

cat > house/1_floor/guest_room/radio_broadcast.txt << EOF
We know how that in the early years of the twentieth century this world was being watch closely by intelligences greater than mans and yet mortal as his own...
EOF

touch house/2_floor/bedroom/{bed.png,window.png}
touch house/2_floor/bedroom/nightstand/{pen.png,note.txt}

cat > house/2_floor/bedroom/nightstand/note.txt << EOF
Some important note
EOF

touch house/2_floor/library/bookcase_{1,2,3}.lib
touch house/basement/MagicCircle.sh
chmod +x house/basement/MagicCircle.sh
cat > house/basement/MagicCircle.sh << EOF
#!/bin/bash
touch Demon.png
EOF
