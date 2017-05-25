
if ! $(grep -q ". /home/vagrant/.credentials" "/home/vagrant/.profile"); then
  echo "... source ~/.credentials from ~/.profile"
  echo -e ". /home/vagrant/.credentials\n$(cat /home/vagrant/.profile)">/home/vagrant/.profile
fi


echo "... add env vars to /home/vagrant/.credentials"

cat << EOF > /home/vagrant/.credentials

# VM 
export VM_TEMP_PATH='/vagrant/tmp'

# GIT
export GITHUB_TOKEN="$GITHUB_TOKEN"
export GITHUB_USER="$GITHUB_USER"
export GITHUB_NAME="$GITHUB_NAME"
export GITHUB_EMAIL="$GITHUB_EMAIL"




# AWS

## PROJECT
export AWS_PROJECT_NAME="$AWS_PROJECT_NAME"

## CREDENTIALS
export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"

## GEOGRAPHY
export AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION"
export AZ1="$AZ1"
export AZ2="$AZ2"
export AZ3="$AZ3"

## VPC
export VPC_CIDR="$VPC_CIDR"
export VPC_PRIVATE_DOMAIN="$VPC_PRIVATE_DOMAIN"
export VPC_PUBLIC_DOMAIN="$VPC_PUBLIC_DOMAIN"

## EC2
export EC2_KEY_NAME="$EC2_KEY_NAME"

## RDS
export RDS_MASTER_USERNAME="$RDS_MASTER_USERNAME"
export RDS_MASTER_PASSWORD="$RDS_MASTER_PASSWORD"

### POSTGRES
export PG_DB_NAME="$PG_DB_NAME"
export PG_USER="$PG_USER"
export PG_PASS="$PG_PASS"


# ANSIBLE
export ANSIBLE_CONFIG="/vagrant/ansible.cfg"
export ANSIBLE_ROLES_PATH='/vagrant/tmp/roles'
export ANSIBLE_LIBRARY='/vagrant/tmp/ansible_library'
export ANSIBLE_PRIVATE_KEY_FILE="/vagrant/tmp/ssh/#{ENV['AWS_PREFIX']}-key.pem"



EOF
