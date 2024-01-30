export MOUNT="/home/apiuser"
export PROJECT_ID="niapigw-nonprod"
export ORG_NAME=$PROJECT_ID
export ORG_DISPLAY_NAME="niapigw-nonprod-org"
export ORGANIZATION_DESCRIPTION="NI API Gateway Organization (Non-Prod)"
export RUNTIMETYPE="HYBRID"
export ANALYTICS_REGION="asia-south1"
export VERSION=$(curl –s https://storage.googleapis.com/apigee-release/hybrid/apigee-hybrid-setup/current-version.txt?ignoreCache=1)
export HYBRIDFILES="/apgdev/installerpackages/apigeehybridinstallation/hybrid-files"
export APIGEECTL_HOME="/apgdev/installerpackages/apigeehybridinstallation/apigeectl"
export CERTLOC="/apgdev/installerpackages/apigeehybridinstallation/hybrid-files/certs"
export OVERRIDEFILE="/apgdev/installerpackages/apigeehybridinstallation/hybrid-files/overrides"
