echo "Credentials..."


CREDENTIALS=(
"aws_access_key_id"
"aws_secret_access_key"
"ANSIBLE_CONFIG"
"AWS_DEFAULT_REGION"
"AWS_PREFIX"
)

if ! $(grep -q ". /home/vagrant/.credentials" "/home/vagrant/.profile"); then
  echo ". /home/vagrant/.credentials" >> "/home/vagrant/.profile"
fi

echo "" > /home/vagrant/.credentials
for (( i=0; i<=$(( ${#CREDENTIALS[@]}-1 )); i++ ))
do
  ENV_VAR_NAME=${CREDENTIALS[$i]}
  eval ENV_VAR_VAL=\$${CREDENTIALS[$i]}
  echo "export ${ENV_VAR_NAME}=\"${ENV_VAR_VAL}\"" >> /home/vagrant/.credentials
done






