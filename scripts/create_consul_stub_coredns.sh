#!/usr/bin/env bash
set -eo pipefail

CONSUL_DNS_IP=$(kubectl get svc consul-consul-dns -o jsonpath='{.spec.clusterIP}' -n kube-system --kubeconfig <(echo $KUBECONFIG | base64 --decode))
kubectl get configmap coredns -n kube-system -o yaml --kubeconfig <(echo $KUBECONFIG | base64 --decode) > ${MODPATH}/scripts/coredns.yaml

sed '/^kind: ConfigMap.*/i\
\ \ \ \ consul {
' ${MODPATH}/scripts/coredns.yaml > ${MODPATH}/scripts/coredns1.yaml

sed '/^kind: ConfigMap.*/i\
\ \ \ \ \ \ errors
' ${MODPATH}/scripts/coredns1.yaml > ${MODPATH}/scripts/coredns.yaml

sed '/^kind: ConfigMap.*/i\
\ \ \ \ \ \ cache 30
' ${MODPATH}/scripts/coredns.yaml > ${MODPATH}/scripts/coredns1.yaml

sed '/^kind: ConfigMap.*/i\
\ \ \ \ \ \ forward . '$CONSUL_DNS_IP'
' ${MODPATH}/scripts/coredns1.yaml > ${MODPATH}/scripts/coredns.yaml

sed '/^kind: ConfigMap.*/i\
\ \ \ \ }
' ${MODPATH}/scripts/coredns.yaml > ${MODPATH}/scripts/coredns_apply.yaml

rm ${MODPATH}/scripts/coredns.yaml
rm ${MODPATH}/scripts/coredns1.yaml

kubectl apply -f ${MODPATH}/scripts/coredns_apply.yaml --kubeconfig <(echo $KUBECONFIG | base64 --decode)