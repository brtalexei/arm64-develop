start:
	docker run -d -p 8081:8081 --name nexus -v ${PWD}/data:/nexus-data sonatype/nexus3

stop:
	docker stop nexus
	docker rm nexus