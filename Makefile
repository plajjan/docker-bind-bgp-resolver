
all:
# get latest named.root hint file
	wget -q -O named.root http://www.internic.net/domain/named.root
	docker build -t bind-bgp .
