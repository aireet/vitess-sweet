source ./env.sh


vtgate -tablet_types_to_wait PRIMARY,REPLICA --topo_implementation etcd2 --topo_global_server_address localhost:2379 --topo_global_root /vitess/global -tracer opentracing-jaeger -jaeger-agent-host 127.0.0.1:6831 -tracing-sampling-rate 0.0 

vttablet -topo_implementation=etcd2 -topo_global_server_address=localhost:2379 -topo_global_root=/vitess/global  -tracer opentracing-jaeger -jaeger-agent-host 127.0.0.1:6831 -tracing-sampling-rate 0.0 