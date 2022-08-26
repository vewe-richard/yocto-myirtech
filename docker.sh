#!/bin/bash
case $1 in
	create)
	docker run  -d -v $(pwd):/home/richard/share/ --name yocto jiangjqian/yocto
	;;

	build)
	cd builder
	docker build . -t jiangjqian/yocto
	cd -
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
