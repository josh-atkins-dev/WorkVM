echo "Credentials..."


CREDENTIALS=(
"aws_access_key_id" "${aws_access_key_id}"
"aws_secret_access_key" "${aws_access_key_id}"
"ANSIBLE_CONFIG" "${ANSIBLE_CONFIG}"
"AWS_DEFAULT_REGION" "${AWS_DEFAULT_REGION}"
"AWS_PREFIX" "${AWS_PREFIX}"
)

if ! $(grep -q ". /home/vagrant/.credentials" "/home/vagrant/.profile"); then
  echo ". /home/vagrant/.credentials" >> "/home/vagrant/.profile"
fi

echo "" > /home/vagrant/.credentials
for (( i=0; i<=$(( ${#CREDENTIALS[@]}-1 )); i=i+2 ))
do
  echo "export ${CREDENTIALS[$i]}=\"${CREDENTIALS[$i+1]}\"" >> /home/vagrant/.credentials
done






