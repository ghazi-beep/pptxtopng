#to convert file
docker exec -it -u 0 pptx_converter sh /opt/pptx2png.sh test.pptx

#to build and run the container
sh run.sh
