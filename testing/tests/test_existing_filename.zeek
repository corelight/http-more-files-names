# @TEST-EXEC: zeek -r $TRACES/http-filename.pcap ../../../scripts %INPUT
# @TEST-EXEC: zeek-cut id.orig_h id.resp_h is_orig source mime_type filename < files.log > files.tmp && mv files.tmp files.log
# @TEST-EXEC: btest-diff files.log
