echo "Credentials..."


CREDENTIALS=(
"aws_access_key_id" "${aws_access_key_id}"
"aws_secret_access_key" "${aws_access_key_id}"
"ANSIBLE_CONFIG" "${ANSIBLE_CONFIG}"
"AWS_DEFAULT_REGION" "${AWS_DEFAULT_REGION}"
"AWS_PREFIX" "${AWS_PREFIX}"
)


for (( i=0; i<=$(( ${#CREDENTIALS[@]}-1 )); i=i+2 ))
do

  if ! $(grep -q "export ${CREDENTIALS[$i]}=" "/home/vagrant/.profile"); then
    echo "export ${CREDENTIALS[$i]}=\"${CREDENTIALS[$i+1]}\"" >> /home/vagrant/.profile
  fi
done




