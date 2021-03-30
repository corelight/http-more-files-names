# @TEST-EXEC: zeek -r $TRACES/favicon.pcap ../../../scripts %INPUT
# @TEST-EXEC: zeek-cut tx_hosts rx_hosts source mime_type filename < files.log > files.tmp && mv files.tmp files.log
# @TEST-EXEC: btest-diff files.log
