#!/bin/bash
case $1 in
	create)
	docker run  -d -v $(pwd):/home/richard/share/ --name yocto jiangjqian/yocto
	;;

	build)
	docker build . -t jiangjqian/yocto
	;;

	start)
	docker start yocto
	;;

	stop)
	docker stop yocto
	;;

	*)
	docker exec -it yocto /bin/bash
	;;
esac
