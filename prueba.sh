fEcho()
{  echo "."`date "+ %d/%m/%y - %H:%M:%S"`" . ${1} "
}

generar_resultado() 
{
fEcho "Analizando "${1}
cantidad=`df -h| grep sasdata | grep "-" | wc -l`
if [ ${cantidad} -eq 0 ] ; then
fEcho ${1}"- Presenta caidas"
printf ${1} >> fs_caidos.txt
printf "\n\n\n" >> fs_caidos.txt
df -h >> fs_caidos.txt
printf "\n\n\n" >> fs_caidos.txt
else
fEcho ${1}". Ok"
fi
}

if [ -f fs_caidos.txt ] ; then
fEcho "Se elimina log caida"
rm fs_caidos.txt
fi

generar_resultado "PSASFAIP01"
generar_resultado "PSASFAIP02"
if [ -f fs_caidos.txt ] ; then
cat fs_caidos.txt
fi