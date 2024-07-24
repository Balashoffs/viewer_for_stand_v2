# viewer_for_stand_v2



build web app

    flutter build web --release --web-renderer canvaskit  

build docker container

    docker build -t viewer_for_stand_v2_1.0.0 .\build\web\ -f .\Dockerfile

build apk
    
    flutter build apk --release --obfuscate --split-per-abi --split-debug-info=build/app/outputs/symbols
    
