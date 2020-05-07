docker-build:
	@-docker rmi debian-steam:latest
	docker build -t debian-steam:latest ./

docker-export:
	@-rm ./build/debian-steam.tar
	docker save debian-steam:latest > ./build/debian-steam.tar

docker-import:
	@-docker rmi debian-steam:latest
	docker load < ./build/debian-steam.tar

docker-test:
	docker run --rm \
		--network host \
		--name debian-steam-test \
		-v /etc/timezone:/etc/timezone:ro \
		-it debian-steam:latest /bin/bash

docker-push:
	docker login
	docker tag debian-steam zombaksteam/debian-steam:latest
	docker push zombaksteam/debian-steam:latest
	docker rmi zombaksteam/debian-steam:latest
	docker rmi debian-steam:latest
