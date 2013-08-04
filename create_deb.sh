VERSION="0.1"


minepath=uair-$VERSION

python -m py_compile launcher.py

mkdir $minepath
mkdir $minepath/opt
mkdir $minepath/opt/uair
mkdir $minepath/opt/uair/bin
mkdir $minepath/usr/
mkdir $minepath/usr/share/
mkdir $minepath/usr/share/applications/

#copy files
cp *.pyc $minepath/opt/uair/
cp -r static/ $minepath/opt/uair/
cp -r templates/ $minepath/opt/uair/
cp uair.desktop $minepath/usr/share/applications/
cp uairlauncher $minepath/opt/uair/bin/

#mark as exe
chmod +x $minepath/opt/uair/bin/uairlauncher
chmod +x $minepath/usr/share/applications/uair.desktop
cp -r DEBIAN $minepath/

dpkg-deb -b $minepath
cd $minepath
cd ..

#Remove
rm -r  $minepath
