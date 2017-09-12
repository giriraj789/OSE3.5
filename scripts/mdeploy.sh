# switch to metrics project
#oc project openshift-infra
 
DEPLOYER=/usr/share/openshift/hosted/metrics-deployer.yaml
#MASTER_URL=https://openshift.giriaddns.net:8443
#METRIC_DURATION=3
#HAWKULAR_METRICS_HOSTNAME=hawkular-metrics.giriaddns.net
#REDEPLOY=false

# create metrics sa
#oc create -f - <<API
#apiVersion: v1
#kind: ServiceAccount
#metadata:
#  name: metrics-deployer
#secrets:
#- name: metrics-deployer
#API
 
#oadm policy add-role-to-user edit system:serviceaccount:openshift-infra:metrics-deployer
#oadm policy add-cluster-role-to-user cluster-reader system:serviceaccount:openshift-infra:heapster
 
#oc secrets new metrics-deployer nothing=/dev/null
oc process -f $DEPLOYER -p HAWKULAR_METRICS_HOSTNAME=hawkular-metrics.giriaddns.net | oc create -f -
