echo "Credentials..."


CREDENTIALS=($vagrant_credential_vars)

if ! $(grep -q ". /home/vagrant/.credentials" "/home/vagrant/.profile"); then
  echo ". /home/vagrant/.credentials" >> "/home/vagrant/.profile"
fi

echo "" > /home/vagrant/.credentials
for (( i=0; i<=$(( ${#CREDENTIALS[@]}-1 )); i++ ))
do
  ENV_VAR_NAME=${CREDENTIALS[$i]}
  eval ENV_VAR_VAL=\$${CREDENTIALS[$i]}
  echo "... setting ${ENV_VAR_NAME}"
  echo "export ${ENV_VAR_NAME}=\"${ENV_VAR_VAL}\"" >> /home/vagrant/.credentials
done






