name=az-devops-self-hosted-agent

docker build \
--progress plain \
--tag "${name}:linux" \
--label "${name}" \
--file "./Dockerfile" . 

docker run \
-v ./logs:/azp/agent/_diag \
--name "${name}" "${name}:linux"


# -v .agent:.agent \
# -v .credentials:.credentials \
# -v .credentials_rsaparams:.credentials_rsaparams \
