FROM apache/nifi:1.11.4

ENV NIFI_BASE_DIR=/opt/nifi
ENV NIFI_HOME ${NIFI_BASE_DIR}/nifi-current
ENV NIFI_TOOLKIT_HOME ${NIFI_BASE_DIR}/nifi-toolkit-current

ENV NIFI_PID_DIR=${NIFI_HOME}/run
ENV NIFI_LOG_DIR=${NIFI_HOME}/logs
#COPY jdbc/ ${NIFI_HOME}
COPY nifi-flow-audit.h2.db ${NIFI_HOME}/database_repository/nifi-flow-audit.h2.db
COPY flow.xml.gz ${NIFI_HOME}/conf/
COPY state/ ${NIFI_HOME}/state/
COPY jdbc/ ${NIFI_HOME}/jdbc/

USER root

RUN chown -R nifi:nifi ${NIFI_HOME}/
RUN chmod -R u+rw ${NIFI_HOME}/

USER nifi

EXPOSE 8080 8443 10000 8000

WORKDIR ${NIFI_HOME}

# Apply configuration and start NiFi
#
# We need to use the exec form to avoid running our command in a subshell and omitting signals,
# thus being unable to shut down gracefully:
# https://docs.docker.com/engine/reference/builder/#entrypoint
#
# Also we need to use relative path, because the exec form does not invoke a command shell,
# thus normal shell processing does not happen:
# https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example
ENTRYPOINT ["../scripts/start.sh"]
