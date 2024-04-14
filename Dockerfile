FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add bash curl git icu-libs jq

ENV AGENT_VERSION="vsts-agent-linux-x64-3.236.1"

RUN mkdir -p /azp/agent

WORKDIR /azp/agent

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN wget https://vstsagentpackage.azureedge.net/agent/3.236.1/${AGENT_VERSION}.tar.gz 
RUN tar zxvf ./${AGENT_VERSION}.tar.gz
RUN rm ${AGENT_VERSION}.tar.gz 
RUN ls
RUN mkdir _diag

RUN adduser -D agent
RUN chown agent ./
USER agent

# Another option is to run the agent as root.
# ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT ./start.sh