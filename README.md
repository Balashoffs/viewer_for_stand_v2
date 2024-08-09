# viewer_for_stand_v2



build web app

    flutter build web --release --web-renderer canvaskit  

build docker container

    windows: docker build -t viewer_for_stand_v2_1.0.0 .\build\web\ -f .\Dockerfile
    unix: docker build -t viewer_for_stand_v2_1.0.0 ./build/web -f Dockerfile

save docker to zip

    windows: docker save -o viewer_for_stand_v2_2.0.4.tar viewer_for_stand_v2_2.0.4 
    unix: docker save -o viewer_for_stand_v2_2.0.4.tar viewer_for_stand_v2_2.0.4

copy to raspberry viewer image
    
    unix: scp viewer_for_stand_v2_2.0.5.tar fuha@192.168.88.189:/home/fuha/viewer


build apk
    
    flutter build apk --release --obfuscate --split-per-abi --split-debug-info=build/app/outputs/symbols
    
